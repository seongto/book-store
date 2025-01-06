//
//  Fonts.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/27/24.
//

import UIKit

enum TitleSize {
    case title1
    case title2
}

enum HeadlineSize {
    case headline1
    case headline2
}

struct Fonts {
    // MARK: - default font style
    
    static let display1 = UIFont.pretendard(ofSize: 48, weight: .regular)
    static let display1Bold = UIFont.pretendard(ofSize: 48, weight: .semibold)
    
    static let headline1 = UIFont.pretendard(ofSize: 32, weight: .regular)
    static let headline1Bold = UIFont.pretendard(ofSize: 32, weight: .semibold)
    static let headline2 = UIFont.pretendard(ofSize: 28, weight: .regular)
    static let headline2Bold = UIFont.pretendard(ofSize: 28, weight: .semibold)
    
    static let title1 = UIFont.pretendard(ofSize: 24, weight: .regular)
    static let title1Bold = UIFont.pretendard(ofSize: 24, weight: .semibold)
    static let title2 = UIFont.pretendard(ofSize: 18, weight: .regular)
    static let title2Bold = UIFont.pretendard(ofSize: 18, weight: .semibold)
    
    static let body = UIFont.pretendard(ofSize: 14, weight: .regular)
    static let bold = UIFont.pretendard(ofSize: 14, weight: .semibold)
    static let caption = UIFont.pretendard(ofSize: 12, weight: .regular)
}
