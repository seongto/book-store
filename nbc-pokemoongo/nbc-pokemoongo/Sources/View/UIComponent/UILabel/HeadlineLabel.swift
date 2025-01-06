//
//  HeadlineLabel.swift
//  nbc-pokemoongo
//

import UIKit
import SnapKit

class HeadlineLabel: UILabel {
    // MARK: - Life Cycles
    
    init(size: HeadlineSize = .headline2, isBold: Bool = false) {
        super.init(frame: .zero)
        
        setupUIProperties(size: size, isBold: isBold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeadlineLabel {
    func setupUIProperties(size: HeadlineSize, isBold: Bool) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        self.textColor = .fontBlack
        self.textAlignment = .left
        self.numberOfLines = 0
        
        switch size {
        case .headline1:
            self.font = isBold ? Fonts.headline1Bold : Fonts.headline1
        default :
            self.font = isBold ? Fonts.headline2Bold : Fonts.headline2
        }
        
        self.setLineSpacing(lineSpacing: font.pointSize * 1.3)
    }
}
