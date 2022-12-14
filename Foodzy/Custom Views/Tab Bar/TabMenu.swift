//
//  TabNavigationMenu.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 04/08/22.
//

import UIKit

class TabMenu: UIView {
    
    // MARK: Properties
    var itemTapped: ((_ tab: Int) -> Void)?
    var activeItem: Int = 0
    var tabBarItems: [TabBarItem] = []
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(menuItems: [TabItem], frame: CGRect) {
        self.init(frame: frame)
        setupLayout(menuItems, frame)
        setNeedsLayout()
        layoutIfNeeded()
        activateTab(tab: 0)
    }
}

// MARK: - Helper Methods
private extension TabMenu {
    
    func setupLayout(_ menuItems: [TabItem], _ frame: CGRect) {
        layer.backgroundColor = UIColor.white.cgColor
        
        for i in 0 ..< menuItems.count {
            let itemWidth = self.frame.width / CGFloat(menuItems.count)
            let leadingSpace = itemWidth * CGFloat(i)
            
            let itemView = TabBarItem(item: menuItems[i])
            itemView.clipsToBounds = true
            itemView.tag = i
            
            itemView.action = { [weak self] tag in
                guard let self = self else {
                    return
                }
                self.switchTab(from: self.activeItem, to: tag)
            }
            
            tabBarItems.append(itemView)
            
            addSubview(itemView)
            
            itemView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: leadingSpace, bottom: 0, right: 0))
        }
    }
    
    func switchTab(from: Int, to: Int) {
        deactivateTab(tab: from)
        activateTab(tab: to)
    }
    
    func activateTab(tab: Int) {
        let tabBatItem = tabBarItems[tab]
        
        if tab == 0 {
            tabBatItem.itemIconView.image = Asserts.profileSelectedIcon
        } else if tab == 1 {
            tabBatItem.itemIconView.image = Asserts.marketSelectedIcon
        } else if tab == 2 {
            tabBatItem.itemIconView.image = Asserts.chatSelectedIcon
        }
        
        self.activeItem = tab
    }
    
    func deactivateTab(tab: Int) {
        let tabBatItem = tabBarItems[tab]
        
        if tab == 0 {
            tabBatItem.itemIconView.image = Asserts.profileIcon
        } else if tab == 1 {
            tabBatItem.itemIconView.image = Asserts.marketIcon
        } else if tab == 2 {
            tabBatItem.itemIconView.image = Asserts.chatIcon
        }
    }
}
