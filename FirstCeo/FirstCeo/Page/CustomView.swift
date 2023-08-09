//
//  CustomView.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/23.
//

import UIKit

class CustomView: UIView {
    
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    let contentLabel = UILabel()
    
    private let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .pointNavy
        return imageView
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configureLabelConstraints()
    }
    
    func updateTitleLabel(_ text: String?) {
        guard let text = text else { return }
        titleLabel.text = text
    }
    
    func updateContentLabel(_ text: String?) {
        guard let text = text else { return }
        contentLabel.text = text
    }
    
    func updateImage(_ imageName: String?) {
        guard let imageName = imageName else { return }
        iconImageView.image = UIImage(systemName: imageName)
        
        let config = UIImage.SymbolConfiguration(hierarchicalColor: .pointNavy)
        iconImageView.image = iconImageView.image?.applyingSymbolConfiguration(config)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabelConstraints() {
        backgroundColor = .white
        layer.cornerRadius = 15
        clipsToBounds = true
        setHeight( _: 165)
        
        self.setShadow(offset: CGSize(), color: .black, radius: 5, opacity: 0.1)
        
        [titleLabel, contentLabel, iconImageView, chevronImageView].forEach { addSubview($0) }
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        contentLabel.textColor = .black
        contentLabel.font = .systemFont(ofSize: 22, weight: .light)
        contentLabel.numberOfLines = 0
        
        iconImageView.anchor(top: self.topAnchor,
                             leading: self.leadingAnchor,
                             paddingTop: (175 - 80) / 2,
                             paddingLeading: 16)
        
        titleLabel.anchor(top: self.topAnchor,
                          leading: iconImageView.trailingAnchor,
                          paddingTop: (175 - 80) / 2,
                          paddingLeading: 5)
        
        contentLabel.anchor(top: iconImageView.bottomAnchor,
                            leading: self.leadingAnchor,
                            paddingTop: 5,
                            paddingLeading: 16)
        
        chevronImageView.setHeight( _: 35)
        chevronImageView.anchor(top: self.topAnchor,
                                trailing: self.trailingAnchor,
                                paddingTop: (175 - 35) / 2,
                                paddingTrailing: 16)
    }
}

