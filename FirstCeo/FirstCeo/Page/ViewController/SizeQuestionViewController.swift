//
//  SizeQuestionView.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/20.
//

import UIKit

final class SizeQuestionViewController: UIViewController {
    
    private var sizes = Size.sizeRanges
    
    // MARK: - Properties
    
    private lazy var questionLabel = UILabel()

    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = .pointNavy
        progressView.setProgress(0.5, animated: true)
        return progressView
    }()
    
    private lazy var sizeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = UIScreen.main.bounds.width / 19.5
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(SizeCollectionViewCell.self, forCellWithReuseIdentifier: SizeCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceVertical = true
        collectionView.allowsMultipleSelection = true
        collectionView.showsVerticalScrollIndicator = false
    
        return collectionView
    }()
    
    var nextButton = UIButton()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundGray
        [progressView, questionLabel, sizeCollectionView, nextButton].forEach { view.addSubview($0) }
        configureLayout()
        setLabel()
        setButton()
        sizeCollectionView.delegate = self
        sizeCollectionView.dataSource = self
        
        navigationController?.navigationBar.topItem?.title = "사업장 정보 입력하기"
        navigationController?.navigationBar.topItem?.backBarButtonItem?.title = "뒤로가기"
        
    }
    
    private func setLabel() {
        questionLabel.setLabel(labelText: "사업장의 규모를 선택해주세요", isBold: true, textSize: 24, labelColor: .black)
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
        
        sizeCollectionView.anchor(top: questionLabel.bottomAnchor,
                                  leading: view.leadingAnchor,
                                  bottom: nextButton.topAnchor,
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
        
        progressView.setHeight(height: 16)
        nextButton.setHeight(height: 72)
    }
    
    @objc func nextButtonTapped() {
        let profitQuestiosnViewController = ProfitQuestionViewController()
        self.navigationController?.pushViewController(profitQuestiosnViewController, animated: true)
    }
}

extension SizeQuestionViewController {
    private func setButton() {
        nextButton.roundedNextButton(title: "다음", titleSize: 24, titleColor: .white, backgroundColor: .pointNavy)
        nextButton.makeRounded()
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
}


extension SizeQuestionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sizes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SizeCollectionViewCell.reuseIdentifier, for: indexPath) as? SizeCollectionViewCell else { return UICollectionViewCell() }
        
        cell.sizeLabel.text = sizes[indexPath.row].range
        
        if !sizes[indexPath.row].isSizeSelected {
            cell.backgroundColor = .white
            cell.sizeLabel.textColor = .black
            
        } else {
            cell.backgroundColor = .backgroundNavy
            cell.sizeLabel.textColor = .pointNavy
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let anchorSpacing = (screenWidth / 18.57) * 2
        let collectionViewCellWidth = screenWidth - anchorSpacing
        return CGSize(width: collectionViewCellWidth, height: 53)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? SizeCollectionViewCell {
            
            cell.sizeLabel.textColor = .pointNavy
            cell.backgroundColor = .backgroundNavy
            
            sizes[indexPath.row].isSizeSelected = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? KindCollectionViewCell {
            
            cell.categoryLabel.textColor = .black
            cell.backgroundColor = .white
            
            sizes[indexPath.row].isSizeSelected = false
        }
    }
}

