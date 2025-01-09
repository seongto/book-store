
//
//  CartCollectionView.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/31/24.
//

import UIKit
import SnapKit


final class CartCollectionView: UICollectionView {
    
    // MARK: - Life Cycles
    init() {
        super.init(frame: .zero, collectionViewLayout: CartCollectionView.createCompositionalLayout())
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


// MARK: - Setup Layout

extension CartCollectionView {
    
}


// MARK: - Cell Setup

extension CartCollectionView {
    private static func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout(section: CartCollectionView.createBookListSection())
    }
    
    private static func createBookListSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(80)
        )
        let item = NSCollectionLayoutItem(
            layoutSize: itemSize
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(80)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(20)
        )
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        section.boundarySupplementaryItems = [header]
        section.interGroupSpacing = Layouts.itemSpacing2
        section.contentInsets = NSDirectionalEdgeInsets(top: Layouts.itemSpacing1, leading: Layouts.padding, bottom: Layouts.itemSpacing1, trailing: Layouts.padding)
        
        return section
    }
    
    private func setupCollectionView() {
        backgroundColor = .clear
        showsVerticalScrollIndicator = false
        register(
            BookListCell.self,
            forCellWithReuseIdentifier: BookListCell.id
        )
    }
}
