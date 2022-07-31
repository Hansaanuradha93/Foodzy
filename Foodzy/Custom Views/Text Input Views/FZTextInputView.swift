//
//  FZTextInputView.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 31/07/22.
//

import UIKit

class FZTextInputView: UIView {
    
    // MARK: Properties
    private let titleLabel = FZMediumLabel()
    var textField = FZTextField(padding: 16)
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError(ErrorMessages.fatorError)
    }
    
    convenience init(title: String, placeholderText: String) {
        self.init(frame: .zero)
        titleLabel.text = title
        textField.placeholder = placeholderText
    }
}

// MARK: - Private Methods
private extension FZTextInputView {
    
    func setupLayout() {
        textField.setHeight(GlobalConstants.height)
        
        let mainStackView = UIStackView(arrangedSubviews: [titleLabel, textField])
        mainStackView.axis = .vertical
        mainStackView.spacing = 12
        mainStackView.distribution = .fill
        
        addSubview(mainStackView)
        
        mainStackView.fillSuperview()
    }
}
