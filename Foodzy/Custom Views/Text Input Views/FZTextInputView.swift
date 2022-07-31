//
//  FZTextInputView.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 31/07/22.
//

import UIKit

class FZTextInputView: UIView {
    
    // MARK: Properties
    private var isSecureTextEntry: Bool = false
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
    
    convenience init(isSecureTextEntry: Bool = false, title: String, placeholderText: String) {
        self.init(frame: .zero)
        setup(isSecureTextEntry, title, placeholderText)
    }
}

// MARK: - Private Methods
private extension FZTextInputView {
    
    func setup( _ isSecureTextEntry: Bool, _ title: String, _ placeholderText: String) {
        titleLabel.text = title
        textField.placeholder = placeholderText
        textField.isSecureTextEntry = isSecureTextEntry
    }
    
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
