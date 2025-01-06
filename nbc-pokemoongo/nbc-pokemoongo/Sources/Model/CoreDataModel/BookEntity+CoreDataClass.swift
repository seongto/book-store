//
//  BookEntity+CoreDataClass.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 1/6/25.
//
//

import Foundation
import CoreData

@objc(BookEntity)
public class BookEntity: NSManagedObject {
    enum Key {
        static let salePrice = "sale_price"
        
        static let updatedAt = "updated_at"
    }
}
