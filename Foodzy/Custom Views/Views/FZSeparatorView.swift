//
//  SeparatorView.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 31/07/22.
//

import UIKit

class FZSeparatorView: UIView {
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError(ErrorMessages.fatorError)
    }
}

// MARK: - Private Methods
private extension FZSeparatorView {
    
    func setupLayout() {
        let mainStackView = UIStackView()
        mainStackView.distribution = .fillEqually
        mainStackView.spacing = 10
        
        for _ in 1...4 {
            let view = UIView()
            view.backgroundColor = UIColor.appColor(color: .lightGray)
            
            mainStackView.addArrangedSubview(view)
        }
        
        addSubview(mainStackView)
        
        mainStackView.fillSuperview()
    }
}
