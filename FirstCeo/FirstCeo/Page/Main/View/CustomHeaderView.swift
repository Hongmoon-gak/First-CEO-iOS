//
//  CustomHeaderView.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/29.
//

import UIKit

class CustomHeaderView: UICollectionReusableView {
        
    static let reuseIdentifier = "CustomHeaderView"
    
    private let titleLabel = UILabel()
    
    func configureLayout() {
        addSubview(titleLabel)
        titleLabel.setLabel(labelText: "관련 법령 보기", backgroundColor: .clear, weight: .semibold, textSize: 18, labelColor: .black)
        titleLabel.anchor(top: self.topAnchor, leading: self.leadingAnchor, paddingTop: 29, paddingLeading: 20)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        titleLabel.frame = bounds
    }
}
