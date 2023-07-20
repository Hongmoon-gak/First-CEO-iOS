//
//  Label+Extension.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/19.
//

import UIKit

extension UILabel {
    
    func setLabel(labelText: String, isBold: Bool, textSize: Int, labelColor: UIColor) {
        self.text = labelText
        if isBold {
            self.font = .systemFont(ofSize: CGFloat(textSize), weight: .semibold)
        } else {
            self.font = .systemFont(ofSize: CGFloat(textSize), weight: .regular)
        }
        self.textColor = labelColor
    }
}
