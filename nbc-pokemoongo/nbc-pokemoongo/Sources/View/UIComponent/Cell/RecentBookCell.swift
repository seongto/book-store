//
//  RecentBookCell.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 1/6/25.
//

import UIKit
import SnapKit

class RecentBookCell: UICollectionViewCell {
    // MARK: - Properties
    
    static let id: String = "RecentBookCell"
    
    let bookCoverImage: UIImageView = UIImageView()
    let bookTitleLabel: UILabel = BodyLabel()
    
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

extension RecentBookCell {
    func setupSubViews() {
        [
            bookCoverImage,
            bookTitleLabel
        ].forEach { self.addSubview($0) }
    }
    
    func setupUIProperties() {
        self.backgroundColor = Colors.appBackground
        bookTitleLabel.setTextColor(.darkGray)
        bookTitleLabel.textAlignment = .center
    }
    
    func setupLayouts() {
        bookTitleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(Layouts.paddingSmall)
        }
    }
}

// MARK: - Cell Configure

extension RecentBookCell {
    func configure(with book: Book) {
        self.bookTitleLabel.text = book.title
    }
}
