//
//  UIButton+Extensions.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 1/6/25.
//

import UIKit


extension UIButton {
    func getButtonColor(_ color: ButtonColor) -> UIColor {
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


// MARK: - 버튼 액션 할당

extension UIButton {
    /// 부모로부터 액션을 할당받아 버튼의 터치 동작과 연결.
    /// - Parameter action: 동작을 수행하는 클로저
    func applyButtonAction(action: @escaping () -> Void) {
        let actionHandler = UIAction { _ in
            action()
        }
        
        self.addAction(actionHandler, for: .touchUpInside)
    }
    
    /// 부모로부터 비동기 액션을 할당받아 버튼의 터치 동작과 연결.
    /// - Parameter action: 비동기 동작을 수행하는 클로저
    func applyButtonAsyncAction(action: @escaping () async -> Void) {
        let actionHandler = UIAction { _ in
            Task {
                await action()
            }
        }
        
        self.addAction(actionHandler, for: .touchUpInside)
    }
}
