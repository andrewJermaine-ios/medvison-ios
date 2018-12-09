//
//  DoctorSearchVC.swift
//  MV
//
//  Created by Andrew on 10/30/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit
import CoreData

class DoctorSearchVC: UIViewController {
    
    var coreDataObjects = ManagedObjects()
    var fetchedObjects = ManagedObjects()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var allDoctors : Doctor?
    var doctors = Arrays.instance.doctorArray
    var filteredDoctors = [Doctor]()
    var doctor : Doctor?
    let searchController = UISearchController(searchResultsController: nil)
    let searchActive : Bool = false
    let didSelect = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()

        tableView.tableHeaderView = searchController.searchBar

        setupSearchController()

    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.barTintColor = #colorLiteral(red: 0.8811367154, green: 0.4223842025, blue: 0.3645329475, alpha: 1)
        searchController.searchBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        UITextField.appearance(whenContainedInInstancesOf: [type(of: searchController.searchBar)]).tintColor = #colorLiteral(red: 0.3485848904, green: 0.3915342093, blue: 0.5145870447, alpha: 1)
        
    }
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredDoctors = doctors.filter({( doctor : Doctor) -> Bool in
            return doctor.doctorName.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    

    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension DoctorSearchVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

extension DoctorSearchVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFiltering() {
            return filteredDoctors.count
        }

        return doctors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "doctorCell") as? DoctorSearchCell else { return UITableViewCell()}
        
        
        
        if isFiltering() {
            allDoctors = filteredDoctors[indexPath.row]
        } else {
            allDoctors = doctors[indexPath.row]
        }
        
        
        
        cell.configureCell(doctorName: allDoctors!.doctorName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coreDataObjects.saveInteger = 1
        coreDataObjects.deleteInteger = 1
        
        guard let docReasonVC = storyboard?.instantiateViewController(withIdentifier: "userReason") as? DoctorReasonVC else { return }
        
        
        if isFiltering() {
            doctor = filteredDoctors[indexPath.row]
        } else {
            doctor = doctors[indexPath.row]
        }
        
        coreDataObjects.save(savedObject: (doctor?.doctorName)!)
        
        
        present(docReasonVC, animated:  true, completion: nil)
    }
}
