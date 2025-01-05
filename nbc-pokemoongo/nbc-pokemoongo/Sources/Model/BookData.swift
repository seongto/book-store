//
//  BookData.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/31/24.
//

// MARK: - WelcomeMe
struct BookAPIResponse: Codable {
    var documents: [Book]
    var meta: Meta
}


// MARK: - Document
struct Book: Codable {
    var authors: [String]
    var contents: String
    var datetime: String
    var isbn: String
    var price: Int
    var publisher: String
    var salePrice: Int
    var status: String
    var thumbnail: String
    var title: String
    var translators: [String]
    var url: String

    enum CodingKeys: String, CodingKey {
        case authors, contents, datetime, isbn, price, publisher
        case salePrice = "sale_price"
        case status, thumbnail, title, translators, url
    }
}


// MARK: - Meta
struct Meta: Codable {
    var isEnd: Bool
    var pageableCount: Int
    var totalCount: Int

    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
        case pageableCount = "pageable_count"
        case totalCount = "total_count"
    }
}
