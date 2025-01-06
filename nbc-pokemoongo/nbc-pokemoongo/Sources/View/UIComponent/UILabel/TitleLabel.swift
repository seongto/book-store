//
//  TitleLabel.swift
//  nbc-pokemoongo
//

import UIKit
import SnapKit

class TitleLabel: UILabel {
    // MARK: - Life Cycles
    
    init(size: TitleSize = .title2, isBold: Bool = false) {
        super.init(frame: .zero)
        
        setupUIProperties(size: size, isBold: isBold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup UI

extension TitleLabel {
    func setupUIProperties(size: TitleSize, isBold: Bool) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.textColor = .fontBlack
        self.textAlignment = .left
        self.numberOfLines = 0
        
        switch size {
        case .title1:
            self.font = isBold ? Fonts.title1Bold : Fonts.title1
        default :
            self.font = isBold ? Fonts.title2Bold : Fonts.title2
        }
        
        self.setLineSpacing(lineSpacing: font.pointSize * 1.4)
    }
}
