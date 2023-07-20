//
//  NameQuestionViewController.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/17.
//

import UIKit

final class NameQuestionViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var questionLabel = UILabel()

    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = .pointNavy
        
        return progressView
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "사업장 명을 입력해주세요"
        return textField
    }()
    
    private var nextButton = UIButton()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundGray
        setLabel()
        setButton()
        [progressView, questionLabel, nameTextField, nextButton].forEach { view.addSubview($0) }
        navigationController?.navigationBar.topItem?.title = "사업장 정보 입력하기"
        
        configureLayout()
    }
    
    private func setLabel() {
        questionLabel.setLabel(labelText: "사업장 이름은 무엇인가요?", isBold: true, textSize: 24, labelColor: .black)
    }
    private func configureLayout() {
        progressView.anchor(top: view.topAnchor,
                            leading: view.leadingAnchor,
                            trailing: view.trailingAnchor,
                            paddingTop: 115,
                            paddingLeading: 16,
                            paddingTrailing: 16)
        
        questionLabel.anchor(top: progressView.bottomAnchor,
                             leading: view.leadingAnchor,
                             trailing: view.trailingAnchor,
                             paddingTop: 70,
                             paddingLeading: 16,
                             paddingTrailing: 16)
        
        nameTextField.anchor(top: questionLabel.bottomAnchor,
                             leading: view.leadingAnchor,
                             trailing: view.trailingAnchor,
                             paddingTop: 16,
                             paddingLeading: 16,
                             paddingTrailing: 16)
        
        nextButton.anchor(leading: view.leadingAnchor,
                          bottom: view.bottomAnchor,
                          trailing: view.trailingAnchor,
                          paddingLeading: 16,
                          paddingBottom: 32,
                          paddingTrailing: 16)
        
        nameTextField.setHeight(height: 37)
        progressView.setHeight(height: 16)
        nextButton.setHeight(height: 72)
    }
}

extension NameQuestionViewController {
    private func setButton() {
        nextButton.roundedNextButton(title: "다음", titleSize: 24, titleColor: .white, backgroundColor: .pointNavy)
        nextButton.makeRounded()
    }
}
