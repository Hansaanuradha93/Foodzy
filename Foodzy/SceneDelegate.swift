//
//  SceneDelegate.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 30/07/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let controller = SignupVC()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}
