//
//  MovieAppUsingFRApp.swift
//  MovieAppUsingFR
//
//  Created by admin on 05.04.2021.
//

import SwiftUI

@main
struct MovieAppUsingFRApp: App {
    
    @StateObject var coreDM = CoreDataManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, coreDM.viewContext)
        }
    }
}
