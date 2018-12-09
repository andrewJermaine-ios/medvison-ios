//
//  TimeSlotVC.swift
//  MV
//
//  Created by Andrew on 10/26/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit

class TimeSlotVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var time = [AvailableTimes]()
    var location = ["6884 Loolow Ave, Las Vegas NV, 89146",
                    "6884 Loolow Ave, Las Vegas NV, 89146",
                    "6884 Loolow Ave, Las Vegas NV, 89146",
                    "6884 Loolow Ave, Las Vegas NV, 89146",
                    "6884 Loolow Ave, Las Vegas NV, 89146",
                    "6884 Loolow Ave, Las Vegas NV, 89146",
                    "6884 Loolow Ave, Las Vegas NV, 89146",
                    "6884 Loolow Ave, Las Vegas NV, 89146",
                    "6884 Loolow Ave, Las Vegas NV, 89146",
                    "6884 Loolow Ave, Las Vegas NV, 89146",
                    "6884 Loolow Ave, Las Vegas NV, 89146",
                    "6884 Loolow Ave, Las Vegas NV, 89146"
                    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        time = [
            AvailableTimes(time: "9:00 AM"),
            AvailableTimes(time: "9:15 AM"),
            AvailableTimes(time: "9:30 AM"),
            AvailableTimes(time: "9:45 AM"),
            AvailableTimes(time: "10:00 AM"),
            AvailableTimes(time: "10:15 AM"),
            AvailableTimes(time: "10:30 AM"),
            AvailableTimes(time: "10:45 AM"),
            AvailableTimes(time: "11:00 AM"),
            AvailableTimes(time: "11:15 AM"),
            AvailableTimes(time: "11:30 AM"),
            AvailableTimes(time: "11:45 AM")
        ]
        
    
    }
    

    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension TimeSlotVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = #colorLiteral(red: 0.8811367154, green: 0.4223842025, blue: 0.3645329475, alpha: 1)
            headerView.textLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return self.location[section]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.location.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return location.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "times&Location") as? AvailableTimesAndLocationCell else { return UITableViewCell()}
        
        let times : AvailableTimes
        
        times = time[indexPath.row]
        
        cell.configureCell(openTimes: times.time)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let patientProfile = storyboard?.instantiateViewController(withIdentifier: "patientProfileVC") as? PatientProfileVC else { return }
        
        present(patientProfile, animated: true, completion: nil)
        
    }
}
