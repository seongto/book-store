//
//  Colors.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/30/24.
//

import UIKit

enum SystemColors: String {
    case Amber = "Amber"
    case Black = "Black"
    case Blue = "Blue"
    case BlueBlack = "BlueBlack"
    case Brown = "Brown"
    case DarkAmber = "DarkAmber"
    case Emerald = "Emerald"
    case Green = "Green"
    case Khaki = "Khaki"
    case Maroom = "Maroon"
    case NavyBlue = "NavyBlue"
    case NavyGreen = "NavyGreen"
    case Orange = "Orange"
    case Purple = "Purple"
    case Purplegray = "Purplegray"
    case PurpleHeze = "PurpleHeze"
    case Red = "Red"
    case SkyBlue = "SkyBlue"
    case Tangerine = "Tangerine"
    case Violet = "Violet"
}

enum SystemColorRamps: String {
    case r50 = "50"
    case r100 = "100"
    case r200 = "200"
    case r300 = "300"
    case r400 = "400"
    case r500 = "500"
    case r600 = "600"
    case r700 = "700"
    case r800 = "800"
    case r900 = "900"
}

enum LabelFontColor: String {
    case black = "FontBlack"
    case darkGray = "FontDarkGray"
    case disabled = "FontDisabled"
    case gray = "FontGray"
    case white = "FontWhite"
}


struct Colors {
    // MARK: - SystemColor
        
    // 시스템 컬러 교체는 아래의 값을 변경.
    static var selectedColor: SystemColors = .Emerald
    
//    static var asdfasdfe: UIColor = .
    
    static func changeSystemColor(_ color: SystemColors) {
        selectedColor = color
    }
    
    static func systemColor(_ ramp: SystemColorRamps) -> UIColor? {
        return UIColor(named: "\(selectedColor.rawValue)-\(ramp.rawValue)" )
    }
    
    /// 숫자가 낮을수록 연하다.
    /// `.PurpleGray-<ramp>`로 직접 확인 가능.
    static func systemGray(_ ramp: SystemColorRamps) -> UIColor? {
        return UIColor(named: "Purplegray-\(ramp.rawValue)")
    }
    
    
    
    // MARK: - BrandColor
    
    
    
    // MARK: - Basic Colors
    
    static var appBackground: UIColor = .backgroundWhite
    
    static func getButtonColor(_ color: ButtonColor) -> UIColor {
        switch color {
        case .statusRed:
            return .statusRed
        case .statusGreen:
            return .statusGreen
        case .statusYellow:
            return .statusYellow
        case .primary:
            return Colors.systemColor(.r900) ?? .purplegray900
        case .secondary:
            return Colors.systemColor(.r500) ?? .purplegray500
        case .disalbled:
            return Colors.systemColor(.r100) ?? .purplegray100
        }
    }
}
