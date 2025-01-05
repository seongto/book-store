//
//  BookSearchResultCell.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/31/24.
//

import UIKit
import SnapKit

class BookSearchResultCell: UICollectionViewCell {
    // MARK: - Properties
    
    static let id: String = "BookSearchResultCell"
    
    let bookTitleLabel: UILabel = UILabel()
    let bookAuthorLabel: UILabel = UILabel()
    let bookCostLabel: UILabel = UILabel()
    
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubViews()
        setupUIProperties()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {

    }
}


// MARK: - UI Layouts

extension BookSearchResultCell {
    func setupSubViews() {
        [
            bookTitleLabel,
            bookAuthorLabel,
            bookCostLabel
        ].forEach { self.addSubview($0) }
    }
    
    func setupUIProperties() {
        
    }
    
    func setupLayouts() {
        
    }
}

// MARK: - Cell Configure

extension BookSearchResultCell {
    func configure(with book: Book) {
        
        DispatchQueue.global().async { [weak self] in
            
        }
    }
    
}
