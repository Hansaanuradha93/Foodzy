//
//  IconButton.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 30/07/22.
//

import UIKit

class FZIconButton: UIView {
    
    // MARK: Properties
    private let imageView = UIImageView()
    private let titleLabel = FZRegularLabel()
    let button = UIButton()
        
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        createButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError(ErrorMessages.fatorError)
    }
    
    convenience init(icon: UIImage, backgroundColor: UIColor = UIColor.appColor(color: .allWhite), title: String = "", titleColor: UIColor = .black, fontSize: CGFloat = 16) {
        self.init(frame: .zero)
        self.setup(icon: icon, backgroundColor: backgroundColor, title: title, titleColor: titleColor, fontSize: fontSize)
    }
}

// MARK: - Private Methods
private extension FZIconButton {
    
    func setup(icon: UIImage, backgroundColor: UIColor, title: String, titleColor: UIColor, fontSize: CGFloat) {
        self.imageView.image = icon
        self.imageView.contentMode = .scaleAspectFill
        self.backgroundColor = backgroundColor
        self.titleLabel.text = title
        self.titleLabel.textColor = tintColor
        self.titleLabel.font = titleLabel.font.withSize(fontSize)
        self.layer.masksToBounds = false
        self.clipsToBounds = true
        self.layer.cornerRadius = GlobalConstants.cornerRadius
    }
    
    func createButton() {
        addSubviews(imageView, titleLabel, button)
        
        imageView.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 28, bottom: 0, right: 0), size: .init(width: 24, height: 24))
        imageView.centerVerticallyInSuperView()
        titleLabel.anchor(top: nil, leading: imageView.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 12, bottom: 0, right: 0))
        titleLabel.centerVerticallyInSuperView()
        button.fillSuperview()
    }
}
