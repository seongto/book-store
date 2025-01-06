//
//  BookDetailViewController.swift
//  nbc-pokemoongo
//
//


import UIKit
import SnapKit

class BookDetailViewController: UIViewController {
    // MARK: - Properties
    let bookDetailView = BookDetailView()
    let book: Book
    
    // MARK: - Life Cycles
    
    init(selectedBook: Book) {
        self.book = selectedBook
        super.init(nibName: nil, bundle: nil)
        
        view = bookDetailView
        print(book.title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubViews()
        setupUIProperties()
        setupLayouts()
    }
}


// MARK: - UI Layouts
extension BookDetailViewController {
    func setupSubViews() {
        
    }
    
    func setupUIProperties() {
        
    }
    
    func setupLayouts() {
        
    }
}
