//
//  SigninVC.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 30/07/22.
//

import UIKit

class SigninVC: KeyboardHandlingVC {
    
    // MARK: Properties
    private let contentView = UIView()
    
    let titleLabel = FZSemiBoldLabel(text: "Hello again!", textColor: UIColor.appColor(color: .almostBlack))
    let gooleButton = FZIconButton(icon: Asserts.googleIcon, title: "Sign up with Google")

    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScrollView()
        setupLayout()
    }
}

// MARK: - Private Methods
private extension SigninVC {
    
    func setupLayout() {
        gooleButton.setHeight(GlobalConstants.height)
        
        let mainStackView = UIStackView(arrangedSubviews: [titleLabel, gooleButton])
        mainStackView.axis = .vertical
        mainStackView.setCustomSpacing(48, after: titleLabel)
        
        contentView.addSubviews(mainStackView)
        
        mainStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 140, left: GlobalConstants.padding, bottom: 0, right: GlobalConstants.padding))
    }
    
    func configureScrollView() {
        scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        contentView.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 850)
        ])
    }
}
