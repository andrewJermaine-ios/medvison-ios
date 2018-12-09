//
//  AvailableDoctorsVC.swift
//  MV
//
//  Created by Andrew on 10/26/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit

class AvailableDoctorsVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var testDoctorArray = [AvailableDoctor]()
    var testLocationArray = [AvailableLocation]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        testDoctorArray = [
            AvailableDoctor(availableDoctor: "Dr.Silence"),
            AvailableDoctor(availableDoctor: "Dr.Rhythm"),
            AvailableDoctor(availableDoctor: "Dr.Melody")
        ]
        testLocationArray = [
            AvailableLocation(availableLocation: "Coachella"),
            AvailableLocation(availableLocation: "EDC"),
            AvailableLocation(availableLocation: "Bonaroo")
        ]
    }
    


    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension AvailableDoctorsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(Int(testDoctorArray.count))
        return testDoctorArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "doctorCell") as? AvailableDoctorCell else { return UITableViewCell()}
        
        
        //TODO: prepare for JSON conversion here from doctors availabel on day and in same city
        let doctor : AvailableDoctor
        let location : AvailableLocation
        
        doctor = testDoctorArray[indexPath.row]
        location = testLocationArray[indexPath.row]
        
        print(doctor.availableDoctor, location.availableLocation)
        
        cell.configureCell(doctorName: doctor.availableDoctor, location: location.availableLocation)
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let timeSlotVC = storyboard?.instantiateViewController(withIdentifier: "timeSlotVC") as? TimeSlotVC else { return }
        
        present(timeSlotVC, animated: true, completion: nil)
        
        //TODO: Need to save doctor selected here and prepare to request times and locations from the selcted doctor
        
        print("")
    }
}
