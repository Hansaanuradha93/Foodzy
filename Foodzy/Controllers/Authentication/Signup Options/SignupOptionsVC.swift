//
//  SignupOptionsVC.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 02/08/22.
//

import UIKit

class SignupOptionsVC: KeyboardHandlingVC {
    
    // MARK: Properties
    private let contentView = UIView()
    
    let backgroundImageView = UIImageView(image: Asserts.signinBackground)
    let titleLabel = FZSemiBoldLabel(text: "Sign Up", textColor: UIColor.appColor(color: .almostBlack))
    
    let gooleButton = FZIconButton(icon: Asserts.googleIcon, title: "Sign up with Google")
    let facebookButton = FZIconButton(icon: Asserts.facebookIcon, title: "Sign up with Facebook")
    let twitterButton = FZIconButton(icon: Asserts.twitterIcon, title: "Sign up with Twitter")
    let yahooButton = FZIconButton(icon: Asserts.yahooIcon, title: "Sign up with Yahoo")

    let separatorView = FZSeparatorView()
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
private extension SignupOptionsVC {
    
    func setupLayout() {
        view.backgroundColor = .systemBackground
        
        let mainStackView = UIStackView(arrangedSubviews: [titleLabel, gooleButton, facebookButton, twitterButton, yahooButton, separatorView, alreadyHaveAccountLabel, signinButton])
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
