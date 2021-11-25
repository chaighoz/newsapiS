//
//  FavoriteNews+CoreDataProperties.swift
//  newsapi
//
//  Created by Irianda on 30/04/21.
//
//

import Foundation
import CoreData


extension FavoriteNews {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteNews> {
        return NSFetchRequest<FavoriteNews>(entityName: "FavoriteNews")
    }

    @NSManaged public var desc: String?
    @NSManaged public var id: UUID?
    @NSManaged public var image: String?
    @NSManaged public var title: String?
  
  public var wrappedTitle: String {
     title ?? "title ga muncul"
  }
  
  public var wrappedImage: String {
     image ?? "image ga muncul" //nil colaescing
  }
  
  public var wrappedDesc: String {
     desc ?? "desc ga muncul"
  }

}
