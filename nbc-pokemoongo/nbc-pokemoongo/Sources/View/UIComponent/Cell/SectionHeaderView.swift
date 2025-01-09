//
//  SectionHeaderView.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 1/6/25.
//

import UIKit
import SnapKit


class SectionHeaderView: UICollectionReusableView {
    static let id = "SectionHeaderView"
    
    let titleLabel = TitleLabel(isBold: true)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(titleLabel)
        
        titleLabel.setSystemColor(.r900)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func setTitle(_ title: String) {
        self.titleLabel.text = title
    }
}
