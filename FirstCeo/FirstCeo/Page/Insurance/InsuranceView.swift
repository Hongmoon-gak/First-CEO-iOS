//
//  InsuranceView.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/31.
//

import UIKit

protocol CustomViewDelegate: AnyObject {
    func didTapButtonInUIView()
}

class InsuranceView: UIView {
    
    weak var delegate: CustomViewDelegate?
    
    private var categoryLabel = UILabel()
    private var rateLabel = UILabel()
    private var calculatorLabel = UILabel()
    
    private var explanationImageView = UIImageView()
    private var categoryImageView = UIImageView()
    private var rateImageView = UIImageView()
    
    private var calculationButton = UIButton()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setLabel()
        setImage()
        [explanationImageView, categoryLabel, categoryImageView, rateLabel, rateImageView, calculatorLabel, calculationButton].forEach { addSubview($0) }
        setButton()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLabel() {
        categoryLabel.setLabel(labelText: "4대보험 종류", backgroundColor: .white, weight: .bold, textSize: 16, labelColor: .black)
        
        rateLabel.setLabel(labelText: "2023년 4대보험 요율", backgroundColor: .white, weight: .bold, textSize: 16, labelColor: .black)
        
        calculatorLabel.setLabel(labelText: "4대보험 계산기", backgroundColor: .white, weight: .bold, textSize: 16, labelColor: .black)
    }
    
    private func setImage() {
        explanationImageView.setImage(named: "explanation.png")
        categoryImageView.setImage(named: "category.png")
        rateImageView.setImage(named: "rate.png")
    
    @objc func tapCalculationButton() {
        delegate?.didTapButtonInUIView()
    }
    
    private func configureLayout() {
        explanationImageView.anchor(top: self.topAnchor)
        explanationImageView.centerX(inView: self)
        explanationImageView.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 338, height: 263))
        
        categoryLabel.anchor(top: explanationImageView.bottomAnchor, leading: self.leadingAnchor, paddingTop: 12)
        
        categoryImageView.anchor(top: categoryLabel.bottomAnchor, paddingTop: 6)
        categoryImageView.setHeight(height: 77)
        categoryImageView.centerX(inView: self)
        
        rateLabel.anchor(top: categoryImageView.bottomAnchor, leading: self.leadingAnchor)
        
        rateImageView.anchor(top: rateLabel.bottomAnchor)
        rateImageView.centerX(inView: self)
        rateImageView.setHeight(height: 171)
        
        calculatorLabel.anchor(top: rateImageView.bottomAnchor, leading: self.leadingAnchor)
        
        calculationButton.makeRounded()
        calculationButton.roundedNextButton(title: "4대보험 계산하러 가기", titleSize: 16, titleColor: .white, backgroundColor: .pointNavy)
        
        calculationButton.anchor(top: calculatorLabel.bottomAnchor)
        calculationButton.setHeight(height: 54)
        calculationButton.setWidth(width: 354)
        calculationButton.centerX(inView: self)
    }
}
