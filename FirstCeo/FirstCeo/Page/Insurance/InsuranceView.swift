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
    
    private let categoryLabel = UILabel()
    private let rateLabel = UILabel()
    private let calculatorLabel = UILabel()
    
    private let explanationImageView = UIImageView()
    private let categoryImageView = UIImageView()
    private let rateImageView = UIImageView()
    
    private let calculationButton = UIButton()
    
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
        explanationImageView.setImage(named: explanationImageName)
        categoryImageView.setImage(named: categoryImageName)
        rateImageView.setImage(named: rateImageName)
    }
    
    private func setButton() {
        calculationButton.roundedNextButton(title: "4대보험 계산하러 가기", titleSize: 16, titleColor: .white, backgroundColor: .pointNavy)
        calculationButton.addTarget(self, action: #selector(tapCalculationButton), for: .touchUpInside)
    }
    
    @objc func tapCalculationButton() {
        delegate?.didTapButtonInUIView()
    }
    
    private func configureLayout() {
        explanationImageView.anchor(top: self.topAnchor)
        explanationImageView.centerX(inView: self)
        explanationImageView.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 338, height: 263))
        
        categoryLabel.anchor(top: explanationImageView.bottomAnchor, leading: self.leadingAnchor, paddingTop: 30, paddingLeading: 26)
        
        categoryImageView.anchor(top: categoryLabel.bottomAnchor, paddingTop: 6)
        categoryImageView.setHeight( _: 77)
        categoryImageView.centerX(inView: self)
        
        rateLabel.anchor(top: categoryImageView.bottomAnchor, leading: self.leadingAnchor, paddingTop: 30, paddingLeading: 26)
        
        rateImageView.anchor(top: rateLabel.bottomAnchor, leading: self.leadingAnchor, paddingTop: 12, paddingLeading: 26)
        rateImageView.centerX(inView: self)
        rateImageView.setHeight( _: 171)
        
        calculatorLabel.anchor(top: rateImageView.bottomAnchor, leading: self.leadingAnchor, paddingTop: 30, paddingLeading: 26)
        
        calculationButton.makeRounded()
        calculationButton.anchor(top: calculatorLabel.bottomAnchor, paddingTop: 12)
        calculationButton.setHeight( _: 54)
        calculationButton.setWidth( _: 354)
        calculationButton.centerX(inView: self)
    }
}
