//
//  SpecialtyVC.swift
//  MV
//
//  Created by Andrew on 9/16/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit
import CoreData


class ReasonVC: UIViewController {
    
    var saveObjects = ManagedObjects()
    var fetchedObjects = ManagedObjects()

    @IBOutlet weak var specialtyLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var selectedArray = [Reason]()
    var mainReason : Reason?
    var didSelectReason = String()

    var selectedSpecialty: Specialty? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        if let selectedSpecialty = selectedSpecialty {
            if let specialtyLabel = specialtyLabel {
                specialtyLabel.text = "Visit reason: \(selectedSpecialty.specialty)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        configureView()
        
        
        switch selectedSpecialty?.specialty {
        case "Allergist":
            selectedArray = Arrays.instance.allergyReasonArray
        case "Dentist":
            selectedArray = Arrays.instance.dentistReasonArray
        case "Acupuncturist":
            selectedArray = Arrays.instance.acupuncturistReasonArray

        default:
            selectedArray = []
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        saveObjects.fetchSpecialty()

    }

    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension ReasonVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reasonCell") as? ReasonCell else { return UITableViewCell()}
        let reason : Reason
        
        reason = selectedArray[indexPath.row] as! Reason
        
        cell.configureCell(reason: reason.reason)
       
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        saveObjects.saveInteger = 2


        guard let insuranceVC = storyboard?.instantiateViewController(withIdentifier: "InsuranceVC") as? InsuranceVC else { return }
        
        
        mainReason = selectedArray[indexPath.row]
        
        let visitReason = mainReason?.reason
        
        saveObjects.save(savedObject: visitReason!)
        
        present(insuranceVC, animated:  true, completion: nil)
        
        
        
    }
}
