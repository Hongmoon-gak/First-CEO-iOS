//
//  KindQuestionView.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/20.
//

import UIKit

final class KindQuestionViewController: UIViewController {
    
    var categories = Category.categoryNames
    
    // MARK: - Properties
    
    private lazy var questionLabel = UILabel()

    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = .pointNavy
        progressView.setProgress(0.25, animated: true)
        return progressView
    }()
    
    private lazy var kindCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = UIScreen.main.bounds.width / 19.5
        layout.minimumLineSpacing = UIScreen.main.bounds.width / 19.5
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(KindCollectionViewCell.self, forCellWithReuseIdentifier: KindCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceVertical = true
        collectionView.allowsMultipleSelection = true
        collectionView.showsVerticalScrollIndicator = false
    
        return collectionView
    }()
    
    private let nextButton = UIButton()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundGray
        [progressView, questionLabel, kindCollectionView, nextButton].forEach { view.addSubview($0) }
        configureLayout()
        setLabel()
        setButton()
        kindCollectionView.delegate = self
        kindCollectionView.dataSource = self
        
        navigationController?.navigationBar.topItem?.title = "사업장 정보 입력하기"
        navigationController?.navigationBar.topItem?.backBarButtonItem?.title = "뒤로가기"
        
    }
    
    @objc func nextButtonTapped() {
        let sizeQuestionViewController = SizeQuestionViewController()
        self.navigationController?.pushViewController(sizeQuestionViewController, animated: true)
    }
    
    private func setLabel() {
        questionLabel.setLabel(labelText: "어떤 종류의 사업장인가요?", backgroundColor: .clear, weight: .semibold, textSize: 24, labelColor: .black)
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
        
        kindCollectionView.anchor(top: questionLabel.bottomAnchor,
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
        
        progressView.setHeight( _: 16)
        nextButton.setHeight( _: 72)
    }
}

extension KindQuestionViewController {
    private func setButton() {
        nextButton.roundedNextButton(title: "다음", titleSize: 24, titleColor: .white, backgroundColor: .pointNavy)
        nextButton.makeRounded()
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
}


extension KindQuestionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KindCollectionViewCell.reuseIdentifier, for: indexPath) as? KindCollectionViewCell else { return UICollectionViewCell() }
        
        cell.categoryLabel.text = categories[indexPath.row].name
        
        if !categories[indexPath.row].isCategorySelected {
            cell.backgroundColor = .white
            cell.categoryLabel.textColor = .black
            
        } else {
            cell.backgroundColor = .backgroundNavy
            cell.categoryLabel.textColor = .pointNavy
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let anchorSpacing = (screenWidth / 18.57) * 2
        let insetSpacing = (screenWidth / 19.5) * 2
        let collectionViewCellWidth = screenWidth - anchorSpacing - insetSpacing
        return CGSize(width: collectionViewCellWidth / 3, height: collectionViewCellWidth / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? KindCollectionViewCell {
            
            cell.categoryLabel.textColor = .pointNavy
            cell.backgroundColor = .backgroundNavy
            
            categories[indexPath.row].isCategorySelected = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? KindCollectionViewCell {
            
            cell.categoryLabel.textColor = .black
            cell.backgroundColor = .white
            
            categories[indexPath.row].isCategorySelected = false
        }
    }
}

