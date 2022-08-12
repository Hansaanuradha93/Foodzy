//
//  FZTabBar.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 04/08/22.
//

import UIKit

class FZTabBar: UITabBarController {
    
    // MARK: Properties
    var customTabBar: TabMenu!
    var tabBarHeight: CGFloat = 80
    
    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadTabBar()
    }
}

// MARK: - Helper Methods
private extension FZTabBar {
    
    func loadTabBar() {
        let tabItems: [TabItem] = [.profile, .market, .chat]
        
        self.setupCustomTabBar(tabItems) { (controllers) in
            self.viewControllers = controllers
        }
        
        self.selectedIndex = 0
    }
    
    func setupCustomTabBar(_ items: [TabItem], completion: @escaping ([UIViewController]) -> Void) {
        let frame = tabBar.frame
        var controllers = [UIViewController]()
        
        tabBar.isHidden = true
        
        customTabBar = TabMenu(menuItems: items, frame: frame)
        customTabBar.clipsToBounds = true
        customTabBar.itemTapped = self.changeTab
        
        view.addSubview(customTabBar)
        
        customTabBar.anchor(top: nil, leading: tabBar.leadingAnchor, bottom: tabBar.bottomAnchor, trailing: tabBar.trailingAnchor, size: .init(width: 0, height: tabBarHeight))
        
        for i in 0 ..< items.count {
            controllers.append(items[i].viewController)
            
            view.layoutIfNeeded()
            completion(controllers)
        }
    }
    
    func changeTab(tab: Int) {
        self.selectedIndex = tab
    }
}
