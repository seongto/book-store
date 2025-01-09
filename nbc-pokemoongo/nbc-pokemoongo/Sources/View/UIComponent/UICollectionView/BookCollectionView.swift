//
//  BookCollectionView.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/31/24.
//

import UIKit
import SnapKit


final class BookCollectionView: UICollectionView {
    
    // MARK: - Life Cycles
    init() {
        super.init(frame: .zero, collectionViewLayout: BookCollectionView.createCompositionalLayout())
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


// MARK: - Setup Layout

extension BookCollectionView {
    
}


// MARK: - Cell Setup

extension BookCollectionView {
    private static func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, environment -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0:
                return BookCollectionView.createRecentSection()
            case 1:
                return BookCollectionView.createSearchResultSection()
            default:
                return nil
            }
        }
    }
    
    private static func createRecentSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(120),
            heightDimension: .absolute(160)
        )
        let item = NSCollectionLayoutItem(
            layoutSize: itemSize
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(120),
            heightDimension: .absolute(160)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(48)
        )
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .continuous // 가로 스크롤 설정
        section.interGroupSpacing = Layouts.itemSpacing1
        section.contentInsets = NSDirectionalEdgeInsets(top: Layouts.itemSpacing3, leading: Layouts.padding, bottom: Layouts.itemSpacing1, trailing: Layouts.padding)
        
        return section
    }
    
    private static func createSearchResultSection() -> NSCollectionLayoutSection {
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
        section.contentInsets = NSDirectionalEdgeInsets(top: Layouts.itemSpacing2, leading: Layouts.padding, bottom: Layouts.itemSpacing1, trailing: Layouts.padding)
        
        return section
    }
    
    private func setupCollectionView() {
        backgroundColor = .clear
        showsVerticalScrollIndicator = false
        //        showsHorizontalScrollIndicator = false
        register(
            RecentBookCell.self,
            forCellWithReuseIdentifier: RecentBookCell.id
        )
        register(
            BookListCell.self,
            forCellWithReuseIdentifier: BookListCell.id
        )
        register(
            SectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionHeaderView.id
        )
        
    }
}
