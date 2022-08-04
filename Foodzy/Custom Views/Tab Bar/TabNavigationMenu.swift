//
//  TabNavigationMenu.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 04/08/22.
//

import UIKit

class TabNavigationMenu: UIView {
    
    var itemTapped: ((_ tab: Int) -> Void)?
    var activeItem: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(menuItems: [TabItem], frame: CGRect) {
        self.init(frame: frame)
        self.layer.backgroundColor = UIColor.white.cgColor
        
        for i in 0 ..< menuItems.count {
            let itemWidth = self.frame.width / CGFloat(menuItems.count)
            let leadingSpace = itemWidth * CGFloat(i)
            
            let itemView = TabBarItem(item: menuItems[i])
            itemView.action = { [weak self] tag in
                guard let self = self else {
                    return
                }
                self.switchTab(from: self.activeItem, to: tag)
            }
            itemView.clipsToBounds = true
            itemView.tag = i
                        
            self.addSubview(itemView)
            
            itemView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: leadingSpace, bottom: 0, right: 0), size: .init(width: 0, height: frame.height))
        }
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.activateTab(tab: 0)
    }
    
    func switchTab(from: Int, to: Int) {
        self.deactivateTab(tab: from)
        self.activateTab(tab: to)
    }
    
    func activateTab(tab: Int) {
        let tabToActivate = self.subviews[tab]
        let borderWidth = tabToActivate.frame.size.width - 20
        
        let borderLayer = CALayer()
        borderLayer.backgroundColor = UIColor.appColor(color: .mintGreen).cgColor
        borderLayer.name = "active border"
        borderLayer.frame = CGRect(x: 10, y: 0, width: borderWidth, height: 2)
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn, .allowUserInteraction], animations: {
                tabToActivate.layer.addSublayer(borderLayer)
                tabToActivate.setNeedsLayout()
                tabToActivate.layoutIfNeeded()
            })
            self.itemTapped?(tab)
        }
        self.activeItem = tab
    }
    
    func deactivateTab(tab: Int) {
        let inactiveTab = self.subviews[tab]
        let layersToRemove = inactiveTab.layer.sublayers?.filter({ $0.name == "active border" })
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.4, delay: 0.0, options: [.curveEaseIn, .allowUserInteraction], animations: {
                layersToRemove?.forEach({ $0.removeFromSuperlayer() })
                inactiveTab.setNeedsLayout()
                inactiveTab.layoutIfNeeded()
            })
        }
    }
}
