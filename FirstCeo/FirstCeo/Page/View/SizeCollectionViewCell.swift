//
//  SizeCollectionViewCell.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/20.
//

import UIKit

class SizeCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "SizeCollectionViewCell"
    
    lazy var sizeLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(sizeLabel)

        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureCellConstraints()
    }
    
    private func configureCellConstraints() {
        sizeLabel.centerX(inView: contentView)
        sizeLabel.centerY(inView: contentView)
    }
    
}
