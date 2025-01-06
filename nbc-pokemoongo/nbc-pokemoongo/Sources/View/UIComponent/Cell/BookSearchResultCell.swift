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
    
    let bookTitleLabel: UILabel = TitleLabel(isBold: true)
    let bookAuthorLabel: UILabel = BodyLabel()
    let bookCostLabel: UILabel = BodyLabel()
    
    
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
        self.backgroundColor = Colors.appBackground
        self.layer.borderWidth = 1
        self.layer.borderColor = Colors.systemColor(.r900)?.cgColor
                
        bookTitleLabel.setSystemColor(.r900)
        bookAuthorLabel.setTextColor(.gray)
        bookCostLabel.textAlignment = .right
    }
    
    func setupLayouts() {
        bookTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Layouts.itemSpacing3)
            make.leading.trailing.equalToSuperview().inset(Layouts.padding)
        }
        
        bookAuthorLabel.snp.makeConstraints { make in
            make.top.equalTo(bookTitleLabel.snp.bottom).offset(Layouts.itemSpacing2)
            make.leading.equalToSuperview().inset(Layouts.padding)
            make.bottom.equalToSuperview().inset(Layouts.itemSpacing3)
        }
        
        bookCostLabel.snp.makeConstraints { make in
            make.top.equalTo(bookTitleLabel.snp.bottom).offset(Layouts.itemSpacing2)
            make.trailing.equalToSuperview().inset(Layouts.padding)
            make.bottom.equalToSuperview().inset(Layouts.itemSpacing3)
        }
    }
}

// MARK: - Cell Configure

extension BookSearchResultCell {
    func configure(with book: Book) {
        self.bookTitleLabel.text = book.title
        self.bookAuthorLabel.text = book.authors.joined(separator: ", ")
        self.bookCostLabel.text = "\(book.price) 원"
    }
}
