//
//  LawCollectionViewCell.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/29.
//

import UIKit

class LawCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "LawCollectionViewCell"
    
    lazy var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 60, height: 60))
        return imageView
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [categoryLabel, categoryImageView].forEach { contentView.addSubview($0) }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureCellConstraints()
    }
    
    private func configureCellConstraints() {
        categoryLabel.centerX(inView: contentView)
        categoryImageView.centerX(inView: contentView)
        
        categoryImageView.anchor(top: contentView.topAnchor)
        categoryLabel.anchor(top: categoryImageView.bottomAnchor, bottom: contentView.bottomAnchor, paddingTop: 6)

    }

}
