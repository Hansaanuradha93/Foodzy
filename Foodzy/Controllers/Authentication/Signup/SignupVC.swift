//
//  SignupVC.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 01/08/22.
//

import UIKit

class SignupVC: KeyboardHandlingVC {
    
    // MARK: Properties
    private let contentView = UIView()
    
    let backgroundImageView = UIImageView(image: Asserts.signupBackground)
    let titleLabel = FZSemiBoldLabel(text: "Sign Up", textColor: UIColor.appColor(color: .almostBlack))
    let subtitleLabel = FZSemiBoldLabel(text: "Please enter your details", textColor: UIColor.appColor(color: .placeholderGray), fontSize: 16)
    let gooleButton = FZIconButton(icon: Asserts.googleIcon, title: "Sign up with Google")
    let otherOptionsButton = FZRegularButton(backgroundColor: .white, title: "Other Options Sign Up", titleColor: UIColor.appColor(color: .mintGreen), borderColor: UIColor.appColor(color: .mintGreen))

    let nameInputView = FZTextInputView(title: "Name", placeholderText: "Thomas")
    let emailInputView = FZTextInputView(title: "Email", placeholderText: "example@gmail.com")
    let passwordInputView = FZTextInputView(isSecureTextEntry: true, title: "Password", placeholderText: "At least 8 characters")
    let separatorView = FZSeparatorView()
    
    let agreeCheckbox = FZCheckoboxButton(icon: Asserts.stateChecked, borderColor: UIColor.appColor(color: .lightGray), borderWidth: GlobalConstants.borderWidth)
    let termsConditionsLabel = FZSemiBoldLabel(text: "I agree with Terms and Privacy", textColor: UIColor.appColor(color: .placeholderGray), fontSize: 16)
    
    let signupButton = FZRegularButton(backgroundColor: UIColor.appColor(color: .mintGreen), title: "Sign Up", titleColor: .white)
    let alreadyHaveAccountLabel = FZSemiBoldLabel(text: "Already have an account?", textAlignment: .center, textColor: UIColor.appColor(color: .placeholderGray), fontSize: 16)
    let signinButton = FZRegularButton(backgroundColor: .white, title: "Sign In", titleColor: UIColor.appColor(color: .mintGreen), borderColor: UIColor.appColor(color: .mintGreen))

    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScrollView()
        setupLayout()
    }
}

// MARK: - Private Methods
private extension SignupVC {
    
    func setupLayout() {
        view.backgroundColor = .systemBackground
        
        let spacer = UIView()
        spacer.backgroundColor = .red
        
        let termsConditionsStackView = UIStackView(arrangedSubviews: [agreeCheckbox, termsConditionsLabel])
        termsConditionsStackView.distribution = .fill
        termsConditionsStackView.spacing = 16
        
        let mainStackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel, gooleButton, otherOptionsButton, nameInputView, emailInputView, passwordInputView, separatorView, termsConditionsStackView, signupButton, alreadyHaveAccountLabel, signinButton])
        mainStackView.axis = .vertical
        mainStackView.spacing = 24
        mainStackView.setCustomSpacing(12, after: titleLabel)
        mainStackView.setCustomSpacing(48, after: subtitleLabel)

        contentView.addSubviews(mainStackView)

        mainStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 24, left: GlobalConstants.padding, bottom: 0, right: GlobalConstants.padding))
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
