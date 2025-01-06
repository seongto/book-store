//
//  BookEntity+CoreDataProperties.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 1/6/25.
//
//

import Foundation
import CoreData


extension BookEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookEntity> {
        return NSFetchRequest<BookEntity>(entityName: "BookEntity")
    }

    @NSManaged public var authors: String?
    @NSManaged public var contents: String?
    @NSManaged public var datetime: String?
    @NSManaged public var isbn: String?
    @NSManaged public var price: Int16
    @NSManaged public var publisher: String?
    @NSManaged public var salePrice: Int16
    @NSManaged public var status: String?
    @NSManaged public var thumbnail: String?
    @NSManaged public var title: String?
    @NSManaged public var translators: String?
    @NSManaged public var url: String?
    @NSManaged public var updatedAt: Date?

}

extension BookEntity : Identifiable {

}
