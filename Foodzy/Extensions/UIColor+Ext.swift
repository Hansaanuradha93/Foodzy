//
//  UIColor+Ext.swift
//  Foodzy
//
//  Created by Hansa Anuradha on 2022-07-30.
//

import UIKit

enum AssertColor: String {
    case mintGreen = "mint_green"
    case allWhite = "all_white"
    case almostBlack = "almost_black"
    case lightGray = "light-gray"
}

extension UIColor {
    static func appColor(color: AssertColor) -> UIColor {
        return UIColor(named: color.rawValue) ?? .systemBackground
    }
}

struct AppColor {
    static let mintGreen = UIColor.appColor(color: .mintGreen)
    static let allWhite = UIColor.appColor(color: .allWhite)
    static let almostBlack = UIColor.appColor(color: .almostBlack)
    static let lightGray = UIColor.appColor(color: .lightGray)
}
