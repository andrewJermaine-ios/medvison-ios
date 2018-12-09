//
//  LocationVC.swift
//  MV
//
//  Created by Andrew on 9/27/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

class LocationVC: UIViewController {
    
    var chosenLocation : [NSManagedObject] = []
    var fetchedObject: ManagedObjects?
    var saveObjects = ManagedObjects()



    @IBOutlet weak var currentLocationLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var locationManager:CLLocationManager!

    var city = Arrays.instance.citiesArray
    var filteredCities = [Cities]()
    var citySelection : Cities?
    let searchController = UISearchController(searchResultsController: nil)
    var searchActive : Bool = false
    var didSelect = String()
    var userLatitude = Double()
    var userLongitude = Double()
    var geoCoder = CLGeocoder()
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true

        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        tableView.tableHeaderView = searchController.searchBar
        setupSearchController()

        determineMyCurrentLocation()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        saveObjects.fetchInsurance()
    }
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.barTintColor = #colorLiteral(red: 0.8811367154, green: 0.4223842025, blue: 0.3645329475, alpha: 1)
        searchController.searchBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        UITextField.appearance(whenContainedInInstancesOf: [type(of: searchController.searchBar)]).tintColor = #colorLiteral(red: 0.3485848904, green: 0.3915342093, blue: 0.5145870447, alpha: 1)
    }

    
// MARK: Search bar implementation
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredCities = city.filter({( cities: Cities) -> Bool in
            return cities.city.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
   

    
//MARK: Location Functions
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        } else {
            print("Location services are not enabled")
        }
    }
    
    private func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
        if let error = error {
            print("Unable to Reverse Geocode location (\(error))")
        } else {
            if let placemarks = placemarks, let placemark = placemarks.first {
                print(placemark.compactAddress!)
                currentLocationLabel.text = "Current Location: \(placemark.cityOnly!)"
                saveObjects.save(savedObject: placemark.cityOnly!)
                fetchedObject?.location = placemark.cityOnly!
            }
        }
    }
    
    
//MARK: Actions
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func currentLocationPressed(_ sender: Any) {
        saveObjects.saveInteger = 4
        guard let dayVC = storyboard?.instantiateViewController(withIdentifier: "dayVC") as? DayVC else { return }
        determineMyCurrentLocation()
        let location = CLLocation(latitude: userLatitude, longitude: userLongitude)
        geoCoder.reverseGeocodeLocation(location) { (placemarks, error) in
            self.processResponse(withPlacemarks: placemarks, error: error)
        
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.present(dayVC, animated:  true, completion:  nil)
        }
    }
}



// MARK: TableView Extension

extension LocationVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredCities.count
        }
        return city.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell") as? LocationViewCell else { return UITableViewCell()}
        
        let cities : Cities
        
        if isFiltering() {
            cities = filteredCities[indexPath.row]
        } else {
            cities = city[indexPath.row]
        }
        
        cell.configureCell(city: cities.city)
        
        return cell
   
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: Create unwind segue back to main view with selected city value
        saveObjects.saveInteger = 4


        guard let dayVC = storyboard?.instantiateViewController(withIdentifier: "dayVC") as? DayVC else { return }
        

        if isFiltering() {
            citySelection = filteredCities[indexPath.row]
        } else {
            citySelection = city[indexPath.row]
        }
        
        let didSelect = citySelection?.city

        saveObjects.save(savedObject: didSelect!)
        fetchedObject?.location = didSelect
        
        if searchController.isActive {
            self.searchController.dismiss(animated: false) {
                self.present(dayVC, animated: true, completion: nil)
            }
        } else {
            self.present(dayVC, animated: true, completion: nil)

        }
        
        
        
    
    }
}




//MARK: Search extension

extension LocationVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
        
    }
}



// MARK: Location Extension

extension LocationVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation

        //call stopUpdatingLocation() to stop listenting for location updates, if you dont itll update every time the location changes
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        userLatitude = Double(userLocation.coordinate.latitude)
        userLongitude = Double(userLocation.coordinate.longitude)
        manager.stopUpdatingLocation()

        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
    
    
    //TODO: Implement location status denied UI/UX with popup
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        if (status == CLAuthorizationStatus.denied){
//            showLocationDisabledpopUp()
//        }
//    }
//    func showLocationDisabledpopUp() {
//        let alertController = UIAlertController(title: "Background Location Access  Disabled", message: "We need your location", preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        alertController.addAction(cancelAction)
//        let openAction = UIAlertAction(title: "Open Setting", style: .default) { (action) in
//            if let url = URL(string: UIApplicationOpenSettingsURLString){
//                UIApplication.shared.open(url, options: [:], completionHandler: nil)
//            }
//        }
//        alertController.addAction(openAction)
//        self.present(alertController, animated: true, completion: nil)
//    }
}

//MARK: Placemark extension
extension CLPlacemark {
    var compactAddress: String? {
        if let name = name {
            var result = name
            
            if let city = locality {
                result += ", \(city)"
            }
            
            if let state = administrativeArea {
                result += ", \(state)"
            }
            
            if let country = country {
                result += ", \(country)"
            }
            
            return result
        }
        return nil
    }
    
    var cityOnly: String? {
        if let city = locality {
           var result = city
            
            return result
        }
        return nil
    }
}

