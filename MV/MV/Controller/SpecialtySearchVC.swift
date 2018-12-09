//
//  ViewController.swift
//  MV
//
//  Created by Andrew on 9/14/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit
import CoreData

class SpecialtySearchVC: UIViewController {
    
    var saveObjects = ManagedObjects()

    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var specialties = Arrays.instance.specialtiesArray
    var filteredSpecialties = [Specialty]()
    var specialty : Specialty?
    let searchController = UISearchController(searchResultsController: nil)
    var searchActive : Bool = false
    var didSelect = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        Arrays.init()
        
        setupSearchController()
        definesPresentationContext = true
        
        tableView.tableHeaderView = searchController.searchBar
       


        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.barTintColor = #colorLiteral(red: 0.8811367154, green: 0.4223842025, blue: 0.3645329475, alpha: 1)
        searchController.searchBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        UITextField.appearance(whenContainedInInstancesOf: [type(of: searchController.searchBar)]).tintColor = #colorLiteral(red: 0.3485848904, green: 0.3915342093, blue: 0.5145870447, alpha: 1)
        
    }
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Search bar implementation
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredSpecialties = specialties.filter({( specialties : Specialty) -> Bool in
            return specialties.specialty.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    //MARK: Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "specialtyVC" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let specialty : Specialty
                if isFiltering() {
                    specialty = filteredSpecialties[indexPath.row]
                } else {
                    specialty = specialties[indexPath.row]
                }
                let controller = (segue.destination as! UINavigationController).topViewController as! ReasonVC
                controller.selectedSpecialty = specialty
                
            }
        }
    }
    
}

extension SpecialtySearchVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredSpecialties.count
        }
        return specialties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "medVisionCell") as? HomeTableCell else { return UITableViewCell()}
        let specialty : Specialty
        
        if isFiltering() {
            specialty = filteredSpecialties[indexPath.row]
        } else {
            specialty = specialties[indexPath.row]
        }
        cell.configureCell(specialty: specialty.specialty)
        //cell.textLabel?.text = self.filteredSpecialties[indexPath.row].specialty
        return cell
    
    }
    //TODO: How do cases work?? Cases may work better than if else's here
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        saveObjects.saveInteger = 1
        
        guard let specialtyVC = storyboard?.instantiateViewController(withIdentifier: "specialtyVC") as? ReasonVC else { return }

        
        if isFiltering() {
            specialty = filteredSpecialties[indexPath.row]
            
        } else {
            specialty = specialties[indexPath.row]
        }
        
        let didSelect = specialty?.specialty

        saveObjects.save(savedObject: didSelect!)
        
        specialtyVC.selectedSpecialty = specialty
       
        
        if searchController.isActive {
            if specialty?.specialty == "Allergist" {
               specialtyVC.selectedArray = Arrays.instance.allergyReasonArray
            }
            self.searchController.dismiss(animated: false) {
                self.present(specialtyVC, animated: true, completion: nil)
            }
        } else {
            if specialty?.specialty == "Allergist" {
                specialtyVC.selectedArray = Arrays.instance.allergyReasonArray
            }
            present(specialtyVC, animated: true, completion: nil)
        }

    }
    
    
}

extension SpecialtySearchVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}



