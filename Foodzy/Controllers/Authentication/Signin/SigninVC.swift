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
    
    let backgroundImageView = UIImageView(image: Asserts.signinBackground)
    
    let titleLabel = FZSemiBoldLabel(text: "Hello again!", textColor: UIColor.appColor(color: .almostBlack))
    let gooleButton = FZIconButton(icon: Asserts.googleIcon, title: "Sign up with Google")
    let emailInputView = FZTextInputView(title: "Email", placeholderText: "example@gmail.com")
    let passwordInputView = FZTextInputView(isSecureTextEntry: true, title: "Password", placeholderText: "**********")
    let separatorView = FZSeparatorView()
    
    let signinButton = FZRegularButton(backgroundColor: UIColor.appColor(color: .mintGreen), title: "Sign In", titleColor: .white)
    let noAccountLabel = FZSemiBoldLabel(text: "Don't have an account?", textAlignment: .center, textColor: UIColor.appColor(color: .placeholderGray), fontSize: 16)
    let signupButton = FZRegularButton(backgroundColor: .white, title: "Sign Up", titleColor: UIColor.appColor(color: .mintGreen), borderColor: UIColor.appColor(color: .mintGreen))

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
        view.backgroundColor = .systemBackground
        
        let mainStackView = UIStackView(arrangedSubviews: [titleLabel, gooleButton, emailInputView, passwordInputView, separatorView, signinButton, noAccountLabel, signupButton])
        mainStackView.axis = .vertical
        mainStackView.spacing = 24
        mainStackView.setCustomSpacing(48, after: titleLabel)
        mainStackView.setCustomSpacing(24, after: gooleButton)
        
        contentView.addSubviews(mainStackView)
        
        mainStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 140, left: GlobalConstants.padding, bottom: 0, right: GlobalConstants.padding))
    }
    
    func configureScrollView() {
        scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        view.addSubviews(backgroundImageView, scrollView)
        scrollView.addSubview(contentView)
        
        backgroundImageView.fillSuperview()

        scrollView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        contentView.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 850)
        ])
    }
}
