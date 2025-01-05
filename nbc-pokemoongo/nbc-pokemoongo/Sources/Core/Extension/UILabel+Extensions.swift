//
//  UILabel+Extensions.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 1/4/25.
//

import UIKit

enum LabelFontColor: String {
    case black = "FontBlack"
    case darkGray = "FontDarkGray"
    case disabled = "FontDisabled"
    case gray = "FontGray"
    case white = "FontWhite"
}

extension UILabel {
    func setTextColor(_ color: LabelFontColor) {
        self.textColor = UIColor(named: color.rawValue)
    }
}
