//
//  DoctorReasonVC.swift
//  MV
//
//  Created by Andrew on 11/3/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit
import CoreData

class DoctorReasonVC: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    
    var userReason = ManagedObjects()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textField.delegate = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        
        guard let insuranceVC = storyboard?.instantiateViewController(withIdentifier: "InsuranceVC") as? InsuranceVC else { return }
        
        nextButtonPressed()
    }
}

extension DoctorReasonVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
    
        
        textField.resignFirstResponder()
        nextButtonPressed()
        return true
    }
    
    func nextButtonPressed() {
        userReason.saveInteger = 2

        guard let insuranceVC = storyboard?.instantiateViewController(withIdentifier: "InsuranceVC") as? InsuranceVC else { return }
        if textField.text != "" {
        
            userReason.save(savedObject: textField.text!)
            present(insuranceVC, animated: true, completion: nil)

        } else {
            print("Please enter a reason for your visit!")
        }
        
    }
}
