//
//  DividerView.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/23.
//

import UIKit.UIView

class DividerView: UIView {
    func drawHorizontalDividerView(height: CGFloat, color: UIColor) -> UIView {
        let divider = UIView()
        divider.backgroundColor = color
        divider.setHeight(height)
        return divider
    }
}
