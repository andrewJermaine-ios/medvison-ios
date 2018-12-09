//
//  PatientProfileVC.swift
//  MV
//
//  Created by Andrew on 10/26/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit


class PatientProfileVC: UIViewController {

    var textField = UITextField()
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var dateOfBirthTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var stateTF: UITextField!
    @IBOutlet weak var zipCodeTF: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var firstName = String()
    var lastName = String()
    var phone = String()
    var email = String()
    var address = String()
    var dateOfBirth = String()
    var city = String()
    var state = String()
    var zip = String()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        styleTexfields()
        
        scrollView.keyboardDismissMode = .onDrag
    }
    
    
    @IBAction func createProfilePressed(_ sender: Any) {
        
        if firstNameTF.text != nil && firstNameTF.text != firstNameTF.placeholder {
            firstName = firstNameTF.text!
            
        } else {
            
        }
        if lastNameTF.text != nil && lastNameTF.text != lastNameTF.placeholder {
            lastName = lastNameTF.text!
            
        } else {
            
        }
        if phoneTF.text != nil && phoneTF.text != phoneTF.placeholder {
            phone = phoneTF.text!
            
        } else {
            
        }
        if emailTF.text != nil && emailTF.text != emailTF.placeholder {
            email = emailTF.text!
            
        } else {
            
        }
        if addressTF.text != nil && addressTF.text != addressTF.placeholder {
            address = addressTF.text!
            
        } else {
            
        }
        if dateOfBirthTF.text != nil && dateOfBirthTF.text != dateOfBirthTF.placeholder {
            dateOfBirth = dateOfBirthTF.text!
            
        } else {
            
        }
        if cityTF.text != nil && cityTF.text != cityTF.placeholder {
            city = cityTF.text!
            
        } else {
            
        }
        if stateTF.text != nil && stateTF.text != stateTF.placeholder {
            state = stateTF.text!
            
        } else {
            
        }
        if zipCodeTF.text != nil && zipCodeTF.text != zipCodeTF.placeholder {
            zip = zipCodeTF.text!
            
        } else {
            
        }
        //TODO: Turn this to JSON, API must be ready to handle such information, to populate to Patient Profile View on dashboard
        print("Patient Profile: \(firstName),\(lastName),\(phone),\(email),\(address),\(dateOfBirth),\(city),\(state),\(zip),")
        
        
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func createProflePressed(_ sender: Any) {
        guard let bookVC = storyboard?.instantiateViewController(withIdentifier: "bookVC") as? BookAppointmentVC else { return }
        present(bookVC, animated: true, completion:  nil)
    }
    // DESIGN
    
    func styleTexfields() {
        firstNameTF.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lastNameTF.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        phoneTF.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        emailTF.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addressTF.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        dateOfBirthTF.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cityTF.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        stateTF.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        zipCodeTF.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)


        firstNameTF.attributedPlaceholder = NSAttributedString(string: "First name",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        lastNameTF.attributedPlaceholder = NSAttributedString(string: "Last name",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        phoneTF.attributedPlaceholder = NSAttributedString(string: "Phone number",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        emailTF.attributedPlaceholder = NSAttributedString(string: "Email",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        addressTF.attributedPlaceholder = NSAttributedString(string: "Address",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        dateOfBirthTF.attributedPlaceholder = NSAttributedString(string: "Date of Birth",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        cityTF.attributedPlaceholder = NSAttributedString(string: "City",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        stateTF.attributedPlaceholder = NSAttributedString(string: "State",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        zipCodeTF.attributedPlaceholder = NSAttributedString(string: "Zip Code",
                                                              attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    
    }


}
