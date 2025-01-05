//
//  MainView.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/31/24.
//

import UIKit
import SnapKit
import RxCocoa


class MainView: UIView {
    
    // MARK: - UIComponents & Properties
    
    let bookSearchBar = UISearchBar()
    let bookCollectionView: UICollectionView = UICollectionView()
    
    
    // MARK: - Life Cycles
    
    init() {
        super.init(frame: .zero)
        
        setupSubViews()
        setupUIProperties()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - UI Layouts

extension MainView {
    func setupSubViews() {
        [
            bookSearchBar,
//            bookCollectionView
        ].forEach { addSubview($0) }
    }
    
    func setupUIProperties() {
        self.backgroundColor = Colors.appBackground
    }
    
    func setupLayouts() {
        
        bookSearchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(70)
            make.leading.trailing.equalToSuperview()
        }
    }
}


// MARK: - CollectionView Setup

extension MainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}
