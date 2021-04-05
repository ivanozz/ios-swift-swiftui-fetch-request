//
//  CoreDataManager.swift
//  MovieAppUsingFR
//
//  Created by admin on 05.04.2021.
//

import Foundation
import CoreData

open class CoreDataManager: ObservableObject {
    
    let persistantContainer: NSPersistentContainer
    
    static var shared: CoreDataManager = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        persistantContainer.viewContext
    }
    
    private init() {
        persistantContainer = NSPersistentContainer(name: "CoreDataUsingFetchRequest")
        persistantContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data stores \(error)")
            }
        }
    }
    
}
