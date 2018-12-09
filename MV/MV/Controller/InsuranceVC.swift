//
//  InsuranceVC.swift
//  MV
//
//  Created by Andrew on 9/29/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit
import CoreData

class InsuranceVC: UIViewController {

    var chosenInsurance: [NSManagedObject] = []
    var saveObjects = ManagedObjects()



    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var insuranceType = Arrays.instance.insuranceTypeArray
    var filteredInsuranceTypes = [InsuranceTypes]()
    var selectedInsurance: InsuranceTypes?
    var searchController = UISearchController(searchResultsController: nil)
    var searchActive : Bool = false
    var didSelect = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        tableView.tableHeaderView = searchController.searchBar
        setupSearchController()
        

        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        saveObjects.fetchReason()

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
        filteredInsuranceTypes = insuranceType.filter({( insuranceType : InsuranceTypes) -> Bool in
            return insuranceType.type.lowercased().contains(searchText.lowercased())
            
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

extension InsuranceVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
extension InsuranceVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredInsuranceTypes.count
        }
        return insuranceType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "insuranceTypeCell") as? InsuranceViewCell else { return UITableViewCell()}
        
        let insuranceTypesAll : InsuranceTypes
        
        if isFiltering() {
            insuranceTypesAll = filteredInsuranceTypes[indexPath.row]
        } else {
            insuranceTypesAll = insuranceType[indexPath.row]
        
        }
        
        cell.configureCell(insuranceType: insuranceTypesAll.type)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        saveObjects.saveInteger = 3


        guard let locationVC = storyboard?.instantiateViewController(withIdentifier: "LocationVC") as? LocationVC else { return }
        let insuranceTypesAll : InsuranceTypes

        if isFiltering() {
            insuranceTypesAll = filteredInsuranceTypes[indexPath.row]
        } else {
            insuranceTypesAll = insuranceType[indexPath.row]
        }
        
        let didSelect = insuranceTypesAll.type

        saveObjects.save(savedObject: didSelect)

        
        
        if searchController.isActive {
            self.searchController.dismiss(animated: false) {
                self.present(locationVC, animated:  true, completion:  nil)
            }
        } else {
            present(locationVC, animated:  true, completion: nil)

        }
    }
}
