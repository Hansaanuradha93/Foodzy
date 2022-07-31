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
    private let titleLabel = FZMediumLabel()
    let button = UIButton()
        
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError(ErrorMessages.fatorError)
    }
    
    convenience init(icon: UIImage, backgroundColor: UIColor = .white, title: String = "", titleColor: UIColor = .black, fontSize: CGFloat = 16, borderColor: UIColor = UIColor.appColor(color: .lightGray)) {
        self.init(frame: .zero)
        self.setup(icon, backgroundColor, title, titleColor, fontSize, borderColor)
    }
}

// MARK: - Private Methods
private extension FZIconButton {
    
    func setup(_ icon: UIImage, _ backgroundColor: UIColor, _ title: String, _ titleColor: UIColor, _ fontSize: CGFloat, _ borderColor: UIColor) {
        self.imageView.image = icon
        self.imageView.contentMode = .scaleAspectFill
        self.backgroundColor = backgroundColor
        self.titleLabel.text = title
        self.titleLabel.textColor = tintColor
        self.titleLabel.font = titleLabel.font.withSize(fontSize)

        self.setRoundedBorder(borderColor: borderColor, borderWidth: GlobalConstants.borderWidth, radius: GlobalConstants.cornerRadius)
        
        self.setHeight(GlobalConstants.height)
    }
    
    func setupLayout() {
        addSubviews(imageView, titleLabel, button)
        
        titleLabel.centerVerticallyInSuperView()
        titleLabel.centerHorizontallyInSuperView(padding: 12)
        imageView.anchor(top: nil, leading: nil, bottom: nil, trailing: titleLabel.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 8))
        imageView.centerVerticallyInSuperView()
        
        button.fillSuperview()
    }
}
