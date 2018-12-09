//
//  AppointmentSearchVC.swift
//  MV
//
//  Created by Andrew on 10/5/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit
import CoreData

class AppointmentSearchVC: UIViewController {
    
    @IBOutlet weak var specialtyLabel: UILabel!
    @IBOutlet weak var reasonLabel: UILabel!
    @IBOutlet weak var insuranceLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var fetchedObjects = ManagedObjects()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
   override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    fetchedObjects.fetchSpecialty()
    fetchedObjects.fetchReason()
    fetchedObjects.fetchInsurance()
    fetchedObjects.fetchLocation()
    fetchedObjects.fetchDate()
    
    specialtyLabel.text = fetchedObjects.specialty!
    reasonLabel.text = fetchedObjects.reason!
    insuranceLabel.text = fetchedObjects.insurance!
    cityLabel.text = fetchedObjects.location!
    dateLabel.text = fetchedObjects.day!

    }
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func searchButtonPressed(_ sender: Any) {
        guard let availableDoctors = storyboard?.instantiateViewController(withIdentifier: "availableDoctorsVC") as? AvailableDoctorsVC else { return }
        //TODO: must do a get to data base to recieve doctors that are availble in times and locations that match patient request
        //last , specialty, zip,
        //Take this get request block and modifiy it so you can GET the right cities, insurances, doctors, locations and times back, on the appropriate screens
        //Your JSON object is the jsonData line and dont forget to add that to your responseJSON line at the with: parameter.
        let json: [String: Any] = ["last": "Choi"]
        
        print("Reached")
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        print(jsonData)
        
        let session = URLSession.shared
        
        let url = URL(string: "http://localhost:3000/doctor")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // insert json data to the request
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: jsonData!, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        
        task.resume()
        
//        URLSession.shared.dataTask(with: request) { ( data, response, error) in
//            
//            if let response = response {
//                print(response)
//            }
//            
//            if let data = data {
//                
//                print(data)
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: [])
//                    print(json)
//                    
//                } catch let error as NSError {
//                    print("Did not GET \(error.userInfo)")
//                }
//            }
//            
//            }.resume()
        
        
        //present(availableDoctors, animated: true, completion:  nil)
    }
    
 
}
