//
//  FZTextField.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 31/07/22.
//

import UIKit

class FZTextField: UITextField {
    
    // MARK: Properties
    override var intrinsicContentSize: CGSize {
        return .init(width: 0, height: GlobalConstants.height)
    }
    
    private var padding: CGFloat = 0
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(background: UIColor = .white, padding: CGFloat, placeholderText: String = "", fontSize: CGFloat = 16, textColor: UIColor = UIColor.appColor(color: .almostBlack)) {
        self.init()
        configureTextField(background, padding, placeholderText, fontSize, textColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError(ErrorMessages.fatorError)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setRoundedBorder(borderColor: UIColor.appColor(color: .lightGray), borderWidth: GlobalConstants.borderWidth, radius: GlobalConstants.cornerRadius)
    }
}

// MARK: - Private Methods
private extension FZTextField {
    
    func configureTextField(_ background: UIColor, _ padding: CGFloat, _ placeholderText: String, _ fontSize: CGFloat, _ textColor: UIColor) {
        let traits = [UIFontDescriptor.TraitKey.weight: UIFont.Weight.regular]
        var descriptor = UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.family: Fonts.montserrat])
        descriptor = descriptor.addingAttributes([UIFontDescriptor.AttributeName.traits: traits])
        
        self.padding = padding
        self.backgroundColor = background
        self.placeholder = placeholderText
        self.font = UIFont(descriptor: descriptor, size: fontSize)
        self.textColor = textColor
        
        attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.appColor(color: .placeholderGray)])
    }
}

// MARK: - Other Methods
extension FZTextField {
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
}
