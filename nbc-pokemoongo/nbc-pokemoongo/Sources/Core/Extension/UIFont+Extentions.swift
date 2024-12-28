//
//  UIFont+Extentions.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/27/24.
//

import UIKit

enum FontName: String {
    case pretendardExtraLight = "Pretendard-ExtraLight"
    case pretendardThin = "Pretendard-Thin"
    case pretendardLight = "Pretendard-Light"
    case pretendardRegular = "Pretendard-Regular"
    case pretendardMedium = "Pretendard-Medium"
    case pretendardSemiBold = "Pretendard-SemiBold"
    case pretendardBold = "Pretendard-Bold"
    case pretendardExtraBold = "Pretendard-ExtraBold"
    case pretendardBlack = "Pretendard-Black"
}

extension UIFont {
    static func pretendard(ofSize fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        let familyName = "Pretendard"
        var weightString: String
    
        switch weight {
        case .ultraLight:
            weightString = "ExtraLight"
        case .thin:
            weightString = "Thin"
        case .light:
            weightString = "Light"
        case .medium:
            weightString = "Medium"
        case .semibold:
            weightString = "SemiBold"
        case .bold:
            weightString = "Bold"
        case .heavy:
            weightString = "ExtraBold"
        case .black:
            weightString = "Black"
        default:
            weightString = "Regular"
        }

        return UIFont(name: "\(familyName)-\(weightString)", size: fontSize) ?? .systemFont(ofSize: fontSize, weight: .bold)
    }
}
