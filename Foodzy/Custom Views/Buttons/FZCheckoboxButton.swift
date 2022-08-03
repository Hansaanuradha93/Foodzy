//
//  FZCheckoboxButton.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 01/08/22.
//

import UIKit

class FZCheckoboxButton: UIButton {
    
    // MARK: Properties
    private var icon: UIImage?
    private var isChecked: Bool = false
    private let cornerRadius: CGFloat = 7

    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError(ErrorMessages.fatorError)
    }

    convenience init(isChecked: Bool = false, icon: UIImage, backgroundColor: UIColor = .white, borderColor: UIColor = .clear, borderWidth: CGFloat = 1) {
        self.init(frame: .zero)
        self.isChecked = isChecked
        self.icon = icon
        self.setup(icon, backgroundColor, borderColor, borderWidth)
    }
}

// MARK: - Methods
private extension FZCheckoboxButton {
    
    @objc func buttonTapped() {
        if isChecked {
            self.setImage(nil, for: .normal)
            self.setRoundedBorder(borderColor: UIColor.appColor(color: .lightGray), borderWidth: GlobalConstants.borderWidth, radius: cornerRadius)
        } else {
            self.setImage(icon, for: .normal)
            self.setRoundedBorder(borderColor: UIColor.appColor(color: .mintGreen), borderWidth: GlobalConstants.borderWidth, radius: cornerRadius)
        }
        
        isChecked = !isChecked
    }

    func setup(_ icon: UIImage, _ backgroundColor: UIColor, _ borderColor: UIColor, _ borderWidth: CGFloat) {
        self.imageView?.contentMode = .scaleAspectFill
        self.backgroundColor = backgroundColor
        
        self.setRoundedBorder(borderColor: borderColor, borderWidth: borderWidth, radius: 7)
        self.setWidth(24)
        self.setHeight(24)
        
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
}
