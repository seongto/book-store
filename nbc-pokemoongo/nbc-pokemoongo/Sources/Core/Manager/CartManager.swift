//
//  CartManager.swift
//  nbc-pokemoongo
//
//


import Foundation

final class CartManager {
    static let shared = CartManager()

    private var cartItems: [Book] = []

    private init() { }

    
    // MARK: - Public Methods
    func addBook(_ book: Book) {
        cartItems.append(book)
    }

    func removeBook(byISBN isbn: String) {
        cartItems.removeAll { $0.isbn == isbn }
    }

    func totalItems() -> Int {
        return cartItems.count
    }

    func listBooks() -> [Book] {
        return cartItems
    }
}
