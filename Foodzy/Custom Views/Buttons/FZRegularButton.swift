//
//  FZRegularButton.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 31/07/22.
//

import UIKit

class FZRegularButton: UIButton {

    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError(ErrorMessages.fatorError)
    }

    convenience init(backgroundColor: UIColor = .white, title: String = "", titleColor: UIColor = .black, fontSize: CGFloat = 16, borderColor: UIColor = .clear, borderWidth: CGFloat = 2) {
        self.init(frame: .zero)
        self.setup(backgroundColor: backgroundColor, title: title, titleColor: titleColor, fontSize: fontSize, borderColor: borderColor, borderWidth: borderWidth)
    }
}

// MARK: - Methods
extension FZRegularButton {
       
    private func setup(backgroundColor: UIColor, title: String, titleColor: UIColor, fontSize: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        let traits = [UIFontDescriptor.TraitKey.weight: UIFont.Weight.medium]
        var descriptor = UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.family: Fonts.montserrat])
        descriptor = descriptor.addingAttributes([UIFontDescriptor.AttributeName.traits: traits])
        
        self.titleLabel?.font = UIFont(descriptor: descriptor, size: fontSize)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.imageView?.contentMode = .scaleAspectFill
        
        self.setRoundedBorder(borderColor: borderColor, borderWidth: borderWidth, radius: GlobalConstants.cornerRadius)
        self.setHeight(GlobalConstants.height)
    }
}
