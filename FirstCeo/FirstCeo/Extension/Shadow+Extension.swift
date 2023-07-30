//
//  Shadow+Extension.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/30.
//

import UIKit

extension UIView {
    func setShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
        
        layer.masksToBounds = false
    }
}
