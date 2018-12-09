//
//  MedvisionHomeVC.swift
//  MV
//
//  Created by Andrew on 10/31/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit

class MedvisionHomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

    @IBAction func doctorBtnPressed(_ sender: Any) {
        guard let docSearch = storyboard?.instantiateViewController(withIdentifier: "doctorSearch") as? DoctorSearchVC else { return }
        present(docSearch, animated: true, completion: nil)
    }
    
   @IBAction func specialtyBtnPressed(_ sender: Any) {
    guard let specialtySeach = storyboard?.instantiateViewController(withIdentifier: "specialtySearch") as? SpecialtySearchVC else { return }
    
    present(specialtySeach, animated: true, completion:
        nil)
    }
}

extension UIViewController {
    @objc func hideKeyboard() {
        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
//    @objc func dismissKeyboard() {
//        view.endEditing(true)
//    }
}
