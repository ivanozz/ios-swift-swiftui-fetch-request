//
//  Movie+CoreDataProperties.swift
//  MovieAppUsingFR
//
//  Created by admin on 05.04.2021.
//
//

import Foundation
import CoreData

extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var rating: Int16

}

extension Movie : Identifiable {
    
    static var all: NSFetchRequest<Movie> = {
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        return request
    }()
    
    static var byRating: NSFetchRequest<Movie> = {
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "rating", ascending: false)]
        return request
    }()
}
