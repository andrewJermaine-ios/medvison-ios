//
//  DayVC.swift
//  MV
//
//  Created by Andrew on 10/5/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit
import JTAppleCalendar
import CoreData

class DayVC: UIViewController {
    
    private var notification: NSObjectProtocol?
    var chosenDate : [NSManagedObject] = []
    var fetchedObject: ManagedObjects?
    var saveObjects = ManagedObjects()

    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    var calendarStartDate: String? = ""
    var monthNumber: String? = ""
    var appointmentDate: String? = ""

    
    
    let formatter = DateFormatter()
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCalendarView()
        //notification = NotificationCenter.default.addObserver(forName: .UIApplication.willEnterForegroundNotification, object: nil, queue: .main, using: { [unowned self] notification in })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        saveObjects.fetchLocation()
    }
    
    func updateDate() {
        let date = NSDate()
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.month, .day, .year], from: date as Date)
        let day = components.day
        let month = components.month
        let year = components.year
        let currentDate = calendar.date(from: components)
        let userCalendar = NSCalendar.current
        calendarStartDate = String("\(year!) \(month!) \(day!)")
        print(calendarStartDate!)
        
    }
    
    func collectCurrentDayInfo() {
    }
    
    
    func setupCalendarView() {
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 0
        
        calendarView.visibleDates() { (visibleDates) in
            self.setupViewsofCalendar(from: visibleDates)
        }
        
    }
    
    func setupViewsofCalendar(from visibleDates: DateSegmentInfo) {
        let date = visibleDates.monthDates.first!.date
        self.formatter.dateFormat = "yyyy"
        self.yearLabel.text = self.formatter.string(from: date)

        self.formatter.dateFormat = "MMMM"
        self.monthLabel.text = self.formatter.string(from: date)
        
    }
    
    func handleCellTextColor(view: JTAppleCell?, cellState: CellState) {
        guard let validCell = view as? CollectionViewCell else { return }
        if cellState.isSelected {
            validCell.dateLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                validCell.dateLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                validCell.dateLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            }
        }
    }
    
    func handleCellSelected(view: JTAppleCell?, cellState: CellState) {
        saveObjects.saveInteger = 5


        var month: String? = ""
        var day: String? = ""
        var year: String? = ""
        
        switch monthLabel.text {
        case "January":
            monthNumber = "1"
        case "February":
            monthNumber = "2"
        case "March":
            monthNumber = "3"
        case "April":
            monthNumber = "4"
        case "May":
            monthNumber = "5"
        case "June":
            monthNumber = "6"
        case "July":
            monthNumber = "7"
        case "August":
            monthNumber = "8"
        case "September":
            monthNumber = "9"
        case "October":
            monthNumber = "10"
        case "November":
            monthNumber = "11"
        case "December":
            monthNumber = "12"
        
        default:
            monthNumber = "1"
        }
        
        
        guard let validCell = view as? CollectionViewCell else { return }
        if cellState.isSelected {
            validCell.selectedView.isHidden = false
            self.formatter.dateFormat = "dd"
            print(validCell.dateLabel.text!)
            day = validCell.dateLabel.text!
            month = monthLabel.text!
            year = yearLabel.text!
            
            appointmentDate = "\(year!) \(monthNumber!) \(day!)"
            fetchedObject?.day = appointmentDate
            
        } else {
            validCell.selectedView.isHidden = true
        }
    }
    
    

    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        
        
    }
    
}

extension DayVC: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        updateDate()
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: calendarStartDate!)!
        let endDate = formatter.date(from: "2018 12 31")!
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "customCell", for: indexPath) as! CollectionViewCell
        cell.dateLabel.text = cellState.text
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let customCell = cell as! CollectionViewCell
        
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard let appointmentSearchVC = storyboard?.instantiateViewController(withIdentifier: "appointmentSearchVC") as? AppointmentSearchVC else { return }
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        saveObjects.save(savedObject: appointmentDate!)
        present(appointmentSearchVC, animated:  true, completion:  nil)
        
        
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        self.setupViewsofCalendar(from: visibleDates)
    }
}
