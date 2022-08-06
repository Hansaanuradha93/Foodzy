//
//  TabBarItem.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 04/08/22.
//

import UIKit

class TabBarItem: UIView {
    
    // MARK: Properties
    let itemIconView = UIImageView(frame: CGRect.zero)
    var action: ((Int) -> Void)?
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError(ErrorMessages.fatorError)
    }
    
    convenience init(item: TabItem) {
        self.init(frame: .zero)
        setupLayout(item: item)
    }
}

// MARK: - Private Methods
private extension TabBarItem {
    
    @objc func handleTap(_ sender: UIGestureRecognizer) {
        guard let view = sender.view else {
            return
        }
        
        action?(view.tag)
    }
    
    func setupLayout(item: TabItem) {
        itemIconView.image = item.icon.withRenderingMode(.automatic)
        itemIconView.clipsToBounds = true
        
        layer.backgroundColor = UIColor.white.cgColor
        addSubview(itemIconView)
        clipsToBounds = true
        
        itemIconView.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 8, left: 35, bottom: 0, right: 0), size: .init(width: 50, height: 50))
        itemIconView.centerHorizontally(in: self)
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap)))
    }
}
