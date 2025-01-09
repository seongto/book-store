//
//  CustomFilledButton.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 1/6/25.
//

import UIKit
import SnapKit


class CustomFilledButton: UIButton  {
    // MARK: - Properties
    
    let title: String
    let isSmall: Bool
    let isRounded: Bool
    
    
    // MARK: - Life Cycles
    
    init(
        color: ButtonColor = .primary,
        title: String = "확인",
        isSmall: Bool = false,
        isRounded: Bool = false
    ){
        self.title = title
        self.isSmall = isSmall
        self.isRounded = isRounded
        
        super.init(frame: .zero)
        
        setupProperties(color)
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


// MARK: - Setup UI

extension CustomFilledButton {
    func setupProperties(_ color: ButtonColor) {
        let buttonColor = Colors.getButtonColor(color)
        print(buttonColor)
        var config = UIButton.Configuration.filled()
        
        var titleContainer = AttributeContainer()
        titleContainer.font = Fonts.bold
        
        config.attributedTitle = AttributedString(title, attributes: titleContainer)
        config.titleAlignment = .center
        config.background.cornerRadius = isRounded ? Layouts.buttonHeight / 2 : 0
        config.baseForegroundColor = .fontWhite
        config.baseBackgroundColor = buttonColor
        config.contentInsets = NSDirectionalEdgeInsets(top: Layouts.itemSpacing1, leading: Layouts.paddingSmall, bottom: Layouts.itemSpacing1, trailing: Layouts.paddingSmall)
        
        self.configurationUpdateHandler = { _ in
            switch self.state {
            case .normal:
                config.baseBackgroundColor = buttonColor
            case .highlighted:
                config.baseBackgroundColor = buttonColor.withAlphaComponent(0.8)
            case .disabled:
                config.baseBackgroundColor = Colors.getButtonColor(.disalbled)
            default:
                config.baseBackgroundColor = buttonColor
            }
        }
        
        print(config.baseBackgroundColor)
        
        self.configuration = config
        
    }
    
    func setupLayouts() {
        self.snp.makeConstraints { make in
            make.height.equalTo(isSmall ? Layouts.buttonHeightSmall : Layouts.buttonHeight)
            make.width.greaterThanOrEqualTo(80)
            
        }
    }
}
