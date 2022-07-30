//
//  UIColor+Ext.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 2022-07-30.
//

import UIKit

enum AssertColor: String {
    case lightAsh = "light_ash"
}


extension UIColor {
    static func appColor(color: AssertColor) -> UIColor {
        return UIColor(named: color.rawValue)!
    }
}


struct AppColor {
    static let lightAsh = UIColor.appColor(color: .lightAsh)
}
