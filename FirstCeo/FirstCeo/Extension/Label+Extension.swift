//
//  Label+Extension.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/19.
//

import UIKit

extension UILabel {
    
    func setLabel(labelText: String, backgroundColor: UIColor, weight: UIFont.Weight, textSize: Int, labelColor: UIColor) {
        self.text = labelText
        self.backgroundColor = backgroundColor
        self.font = .systemFont(ofSize: CGFloat(textSize), weight: weight)
        self.textColor = labelColor
    }
}
