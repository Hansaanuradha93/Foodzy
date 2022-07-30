//
//  SigninVC.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 30/07/22.
//

import UIKit

class SigninVC: UIViewController {
    
    let gooleButton = FZIconButton(icon: Asserts.googleIcon, title: "Sign up with Google")
    let facebookButton = FZIconButton(icon: Asserts.facebookIcon, title: "Sign up with Facebook")
    let twitterButton = FZIconButton(icon: Asserts.twitterIcon, title: "Sign up with Twitter")
    let yahooButton = FZIconButton(icon: Asserts.yahooIcon, title: "Sign up with Yahoo")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    
        gooleButton.setHeight(GlobalConstants.height)
        facebookButton.setHeight(GlobalConstants.height)
        twitterButton.setHeight(GlobalConstants.height)
        yahooButton.setHeight(GlobalConstants.height)

        let buttonStackView = UIStackView(arrangedSubviews: [gooleButton, facebookButton, twitterButton, yahooButton])
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 20
        
        view.addSubviews(buttonStackView)
        
        buttonStackView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: GlobalConstants.padding, left: GlobalConstants.padding, bottom: 0, right: GlobalConstants.padding))
    }
}
