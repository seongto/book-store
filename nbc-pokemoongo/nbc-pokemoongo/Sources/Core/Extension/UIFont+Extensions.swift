//
//  UIFont+Extensions.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/27/24.
//

import UIKit

/// 현재 프로젝트에 사용되는 폰트 종류를 선언.
/// 기본적으로 이번 프로젝트에서 사용하는 폰트의 굵기는 3가지지만, 폰트 파일수와 용량에 따른 시간비용을 체험해보고자 모두 삽입.
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
        case .regular:
            weightString = "Regular"
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

        return UIFont(name: "\(familyName)-\(weightString)", size: fontSize) ?? .systemFont(ofSize: fontSize, weight: .regular)
    }
}
