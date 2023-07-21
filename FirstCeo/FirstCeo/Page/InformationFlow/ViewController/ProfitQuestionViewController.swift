//
//  ProfitQuestionViewController.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/21.
//

import UIKit

final class ProfitQuestionViewController: UIViewController {
    
    private var profits = Profit.profitRanges
    
    // MARK: - Properties
    
    private lazy var questionLabel = UILabel()

    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = .pointNavy
        progressView.setProgress(0.75, animated: true)
        return progressView
    }()
    
    private lazy var profitCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = UIScreen.main.bounds.width / 19.5
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ProfitCollectionViewCell.self, forCellWithReuseIdentifier: ProfitCollectionViewCell.reuseIdentifier)
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
        [progressView, questionLabel, profitCollectionView, nextButton].forEach { view.addSubview($0) }
        configureLayout()
        setLabel()
        setButton()
        profitCollectionView.delegate = self
        profitCollectionView.dataSource = self
        
        navigationController?.navigationBar.topItem?.title = "사업장 정보 입력하기"
        navigationController?.navigationBar.topItem?.backBarButtonItem?.title = "뒤로가기"
        
    }
    
    private func setLabel() {
        questionLabel.setLabel(labelText: "매출액 규모는 어느정도인가요?", isBold: true, textSize: 24, labelColor: .black)
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
        
        profitCollectionView.anchor(top: questionLabel.bottomAnchor,
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
}

extension ProfitQuestionViewController {
    private func setButton() {
        nextButton.roundedNextButton(title: "첫사장 시작하기", titleSize: 24, titleColor: .white, backgroundColor: .pointNavy)
        nextButton.makeRounded()
    }
}


extension ProfitQuestionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfitCollectionViewCell.reuseIdentifier, for: indexPath) as? ProfitCollectionViewCell else { return UICollectionViewCell() }
        
        cell.profitLabel.text = profits[indexPath.row].range
        
        if !profits[indexPath.row].isProfitSelected {
            cell.backgroundColor = .white
            cell.profitLabel.textColor = .black
            
        } else {
            cell.backgroundColor = .backgroundNavy
            cell.profitLabel.textColor = .pointNavy
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let anchorSpacing = (screenWidth / 18.57) * 2
        let collectionViewCellWidth = screenWidth - anchorSpacing
        return CGSize(width: collectionViewCellWidth, height: 53)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ProfitCollectionViewCell {
            
            cell.profitLabel.textColor = .pointNavy
            cell.backgroundColor = .backgroundNavy
            
            profits[indexPath.row].isProfitSelected = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ProfitCollectionViewCell {
            
            cell.profitLabel.textColor = .black
            cell.backgroundColor = .white
            
            profits[indexPath.row].isProfitSelected = false
        }
    }
}

