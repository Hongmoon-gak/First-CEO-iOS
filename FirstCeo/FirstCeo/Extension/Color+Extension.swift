//
//  Color+Extension.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/16.
//

import UIKit.UIColor

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

extension UIColor {
    /// 배경 회색
    static var backgroundGray: UIColor {
        return UIColor(rgb: 0xF6F6F6)
    }
    
    static var pointNavy: UIColor {
        return UIColor(rgb: 0x183670)
    }
    
    static var backgroundNavy: UIColor {
        return UIColor(rgb: 0xC0CDE8)
    }
    
    static var dividerGraycolor: UIColor {
        return UIColor(rgb: 0xC3C3C3)
    }
}
