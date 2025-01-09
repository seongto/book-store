//
//  BookCartView.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/31/24.
//

import UIKit
import SnapKit
import RxCocoa


class BookCartView: UIView {
    // MARK: - UIComponents & Properties
    
    let cartCollectionView = BookCollectionView()
    
    
    // MARK: - Life Cycles
    
    
}

// MARK: - UI Layouts
extension BookCartView {
    func setupSubViews() {
        [
            cartCollectionView
        ].forEach { addSubview($0) }
    }
    
    func setupUIProperties() {
        
    }
    
    func setupLayouts() {
        cartCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
        }
    }
}
