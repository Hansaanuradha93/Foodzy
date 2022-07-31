//
//  FZSemiBoldLabel.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 30/07/22.
//

import UIKit

class FZSemiBoldLabel: UILabel {

    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError(ErrorMessages.fatorError)
    }

    convenience init(text: String = "", textAlignment: NSTextAlignment = .left, textColor: UIColor, fontSize: CGFloat = 28, numberOfLines: Int = 1) {
        self.init(frame: .zero)
        let traits = [UIFontDescriptor.TraitKey.weight: UIFont.Weight.medium]
        var descriptor = UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.family: Fonts.montserrat])
        descriptor = descriptor.addingAttributes([UIFontDescriptor.AttributeName.traits: traits])

        self.text = text
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.font = UIFont(descriptor: descriptor, size: fontSize)
        self.numberOfLines = numberOfLines
    }
}
