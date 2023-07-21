//
//  CustomButton.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/19.
//

import UIKit

extension UIButton {
    
    func roundedNextButton(title: String, titleSize: Int, titleColor: UIColor, backgroundColor: UIColor) {
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: CGFloat(titleSize), weight: .bold)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
    }
    
    func makeRounded() {
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }
}
