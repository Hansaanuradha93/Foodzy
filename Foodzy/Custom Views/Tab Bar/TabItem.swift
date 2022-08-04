//
//  TabItem.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 04/08/22.
//

import UIKit

enum TabItem: String, CaseIterable {
    
    // Cases
    case profile = "profile"
    case market = "market"
    case chat = "chat"
    
    // Properties
    var viewController: UIViewController {
        switch self {
            case .profile:
                return ProfileVC()
                
            case .market:
                return MarketVC()
                
            case .chat:
                return ChatVC()
            }
    }
    
    var icon: UIImage {
        switch self {
            case .profile:
                return Asserts.profileIcon
                
            case .market:
                return Asserts.marketIcon
                
            case .chat:
                return Asserts.chatIcon
        }
    }
    
    var selectedIcon: UIImage {
        switch self {
            case .profile:
                return Asserts.profileSelectedIcon
                
            case .market:
                return Asserts.marketSelectedIcon
                
            case .chat:
                return Asserts.chatSelectedIcon
        }
    }
}
