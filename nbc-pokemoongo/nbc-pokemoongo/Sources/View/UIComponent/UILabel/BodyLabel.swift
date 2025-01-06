//
//  BodyLabel.swift
//  nbc-pokemoongo
//
//

import UIKit
import SnapKit


class BodyLabel: UILabel {
    // MARK: - Life Cycles
    
    init(isBold: Bool = false) {
        super.init(frame: .zero)
        
        setupUIProperties(isBold: isBold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BodyLabel {
    func setupUIProperties(isBold: Bool) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.textColor = .fontBlack
        self.textAlignment = .left
        self.numberOfLines = 0
        self.font = isBold ? Fonts.body : Fonts.bold
        self.setLineSpacing(lineSpacing: font.pointSize * 1.5)
    }
}
