//
//  UIColor+Extensions.swift
//  LBTAYouTubeTutorial
//
//  Created by Kevin Quisquater on 19/10/2017.
//  Copyright © 2017 Kevin Quisquater. All rights reserved.
//

import UIKit

extension UIColor {
    static let graySeparatorLine = UIColor(red: 230, green: 230, blue: 230)
    static let redNavigationBar = UIColor(red: 230, green: 32, blue: 31)
    static let redStatusBar = UIColor(red: 194, green: 31, blue: 31)
    static let darkRedMenuItemUnselected = UIColor(red: 91, green: 14, blue: 13)
    
    // https://medium.com/ios-os-x-development/ios-extend-uicolor-with-custom-colors-93366ae148e6
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
}
