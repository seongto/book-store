//
//  UILabel+Extensions.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 1/4/25.
//

import UIKit


extension UILabel {
    func setTextColor(_ color: LabelFontColor) {
        self.textColor = UIColor(named: color.rawValue)
    }
    
    func setSystemColor(_ ramp: SystemColorRamps) {
        self.textColor = Colors.systemColor(ramp)
    }
}

// MARK: - UILabel Utilities

extension UILabel {
    /// UILabel 에 줄간격을 쉽게 적용시켜 사용하기 위한 메소드
    /// 기본값을 설정하였으므로 아래 둘 중 하나를 선택하여 사용.
    /// - Parameters:
    ///   - lineSpacing: 각 줄 사이의 간격을 의미합니다.
    ///   - paragraphSpacing: 문단 간격을 설정합니다.
    func setLineSpacing(lineSpacing: CGFloat = 0.0, paragraphSpacing:CGFloat = 0.0) {
        guard let labelText = self.text else { return }

        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.paragraphSpacing = paragraphSpacing

        let attributedString:NSMutableAttributedString
        
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }

        // Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        self.attributedText = attributedString
        
        /*
         위 메소드는 다음과 같은 형식으로 사용합니다.
         let label = UILabel()
         
         label.setLineSpacing(lineSpacing: 10.0)
         label.setLineSpacing(paragraphSpacing: 10.0)
         label.setLineSpacing(lineSpacing: 10.0, paragraphSpacing: 10.0)
         */
    }
}
