//
//  ProfitCollectionViewCell.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/21.
//

import UIKit

class ProfitCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ProfitCollectionViewCell"
    
    lazy var profitLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(profitLabel)

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
        profitLabel.centerX(inView: contentView)
        profitLabel.centerY(inView: contentView)
    }
    
}
