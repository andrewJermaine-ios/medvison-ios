//
//  ManagedObjects.swift
//  MV
//
//  Created by Andrew on 10/12/18.
//  Copyright © 2018 Andrew. All rights reserved.
//

import Foundation
import UIKit
import CoreData


struct ManagedObjects {

    var specialty: String?
    var reason: String?
    var insurance: String?
    var location: String?
    var day: String?
    
    var chosenSpecialty: [NSManagedObject] = []
    var saveInteger = Int()
    var deleteInteger = Int()
    var fetchInteger = Int()
  

    mutating func save(savedObject: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "AppData", in: managedContext)!
        let careType = NSManagedObject(entity: entity, insertInto: managedContext)
        let reason = NSManagedObject(entity: entity, insertInto: managedContext)
        let insurance = NSManagedObject(entity: entity, insertInto: managedContext)
        let location = NSManagedObject(entity: entity, insertInto: managedContext)
        let calendarDate = NSManagedObject(entity: entity, insertInto: managedContext)
        
        switch saveInteger {
        case 1:
            careType.setValue(savedObject, forKey: "careType")
            self.chosenSpecialty.append(careType)
            
       
        case 2:
            reason.setValue(savedObject, forKey: "reason")
            self.chosenSpecialty.append(reason)

        case 3:
            insurance.setValue(savedObject, forKey: "insuranceType")
            self.chosenSpecialty.append(insurance)
            
        case 4:
            location.setValue(savedObject, forKey: "location")
            self.chosenSpecialty.append(location)

        case 5:
            calendarDate.setValue(savedObject, forKey: "calendarDate")
            self.chosenSpecialty.append(calendarDate)
            
        default:
            break
        }
        
        do {
            try managedContext.save()
            print("Saved")
            
        } catch let error as NSError {
            print("Could not save \(error.userInfo)")
        }
        
        
    }
    
    mutating func delete(deletedObject: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "AppData", in: managedContext)!
        let careType = NSManagedObject(entity: entity, insertInto: managedContext)
        let reason = NSManagedObject(entity: entity, insertInto: managedContext)
        let insurance = NSManagedObject(entity: entity, insertInto: managedContext)
        let location = NSManagedObject(entity: entity, insertInto: managedContext)
        let calendarDate = NSManagedObject(entity: entity, insertInto: managedContext)
        
        
        switch deleteInteger {
        case 1:
            careType.setValue(deletedObject, forKey: "careType")
            managedContext.delete(careType)
        case 2:
            reason.setValue(deletedObject, forKey: "reason")
            managedContext.delete(reason)
        case 3:
            insurance.setValue(deletedObject, forKey: "insuranceType")
            managedContext.delete(insurance)
        case 4:
            location.setValue(deletedObject, forKey: "location")
            managedContext.delete(location)
        case 5:
            calendarDate.setValue(deletedObject, forKey: "calendarDate")
            managedContext.delete(calendarDate)

        default:
            break
        }
        
        
        
        
        
    }
    
    mutating func fetchSpecialty() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        var myPredicate = NSPredicate(format: "careType != nil")

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "AppData")
        
        fetchRequest.predicate = myPredicate
        
        do {
            chosenSpecialty = try managedContext.fetch(fetchRequest)
            for data in chosenSpecialty {
               //fetchedObject?.specialty = data.value(forKey: "careType") as? String
                
                
                specialty = data.value(forKey: "careType") as? String
                
                
                print(data.value(forKey: "careType") as? String)
               

            }
        } catch let error as NSError {
            print("Could not fetch \(error.userInfo)")
        }
    }
    
    mutating func fetchReason() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        var myPredicate = NSPredicate(format: "reason != nil")
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "AppData")
        
        fetchRequest.predicate = myPredicate
        
        do {
            chosenSpecialty = try managedContext.fetch(fetchRequest)
            for data in chosenSpecialty {
                //fetchedObject?.specialty = data.value(forKey: "careType") as? String
                
                
                reason = data.value(forKey: "reason") as? String
                
                
                print(data.value(forKey: "reason") as? String)
                
                
            }
        } catch let error as NSError {
            print("Could not fetch \(error.userInfo)")
        }
    }
    mutating func fetchInsurance() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        var myPredicate = NSPredicate(format: "insuranceType != nil")
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "AppData")
        
        fetchRequest.predicate = myPredicate
        
        do {
            chosenSpecialty = try managedContext.fetch(fetchRequest)
            for data in chosenSpecialty {
                //fetchedObject?.specialty = data.value(forKey: "careType") as? String
    
                insurance = data.value(forKey: "insuranceType") as? String
                
                
                print(data.value(forKey: "insuranceType") as? String)
                
                
            }
        } catch let error as NSError {
            print("Could not fetch \(error.userInfo)")
        }
    }
    mutating func fetchLocation() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        var myPredicate = NSPredicate(format: "location != nil")
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "AppData")
        
        fetchRequest.predicate = myPredicate
        
        do {
            chosenSpecialty = try managedContext.fetch(fetchRequest)
            for data in chosenSpecialty {
                //fetchedObject?.specialty = data.value(forKey: "careType") as? String
                
             
                location = data.value(forKey: "location") as? String
                
               
                print(data.value(forKey: "location") as? String)
                
            }
        } catch let error as NSError {
            print("Could not fetch \(error.userInfo)")
        }
    }
    mutating func fetchDate() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        var myPredicate = NSPredicate(format: "calendarDate != nil")
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "AppData")
        
        fetchRequest.predicate = myPredicate
        
        do {
            chosenSpecialty = try managedContext.fetch(fetchRequest)
            for data in chosenSpecialty {
                //fetchedObject?.specialty = data.value(forKey: "careType") as? String
            
                day = data.value(forKey: "calendarDate") as? String
                
                print(data.value(forKey: "calendarDate") as? String)
                
            }
        } catch let error as NSError {
            print("Could not fetch \(error.userInfo)")
        }
    }
    
    

    


}
