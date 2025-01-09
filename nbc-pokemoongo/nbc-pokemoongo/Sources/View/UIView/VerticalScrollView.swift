//
//  VerticalScrollView.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/31/24.
//

import UIKit
import SnapKit

class VerticalScrollView: UIScrollView {
    // MARK: - Properties
    let contentView = UIView()
    
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

extension VerticalScrollView {
    override func addSubview(_ subView: UIView) {
        contentView.addSubview(subView)
    }
    
    func setupSubViews() {
        print("aaaa")
        super.addSubview(contentView)
        print("bbbb")
    }
    
    func setupUIProperties() {
        self.backgroundColor = Colors.appBackground
        contentView.backgroundColor = Colors.appBackground
    }
    
    func setupLayouts() {
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}
