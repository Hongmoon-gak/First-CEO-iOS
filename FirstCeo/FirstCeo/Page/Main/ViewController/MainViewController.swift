//
//  MainViewController.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/21.
//

import UIKit

class MainViewController: UIViewController {
    
    let laws = Law.laws
    
    //MARK: - Properties
    
    var diagnosisView = CustomView()
    var informationView = CustomView()
    private lazy var divider = DividerView().drawHorizontalDividerView(height: 0.3, color: .dividerGraycolor)
    
    private var helloLabel: UILabel = {
       let label = UILabel()
        label.text = "안녕하세요,"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .ultraLight)
        label.textAlignment = .left
        return label
    }()

    private var nameLabel = UILabel()
    private var lawLabel = UILabel()
    
    private lazy var lawCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = UIScreen.main.bounds.width / 19.5
        layout.minimumLineSpacing = UIScreen.main.bounds.width / 19.5
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(KindCollectionViewCell.self, forCellWithReuseIdentifier: KindCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.alwaysBounceHorizontal = true
    
        return collectionView
    }()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundGray
        configureCustomView()
        setLabel()
        [helloLabel, nameLabel, diagnosisView, informationView, divider, lawLabel, lawCollectionView].forEach { view.addSubview($0) }
        configureLayout()
        lawCollectionView.dataSource = self
        lawCollectionView.delegate = self
    }
    
    private func configureCustomView() {
        diagnosisView.updateImage("stethoscope")
        diagnosisView.updateTitleLabel("고용 건강 진단하기")
        diagnosisView.updateContentLabel("사업장 고용 건강을\n진단하고 관리 받으세요")
        
        informationView.updateImage("building.2")
        informationView.updateTitleLabel("내 사업자 정보 수정하기")
        informationView.updateContentLabel("내 사업장 정보를 입력하고 \n맞춤 정보를 제공받으세요!")
    }
    
    private func configureLayout() {
        helloLabel.anchor(top: view.topAnchor,
                          leading: view.leadingAnchor,
                          trailing: view.trailingAnchor,
                          paddingTop: 96,
                          paddingLeading: 16)
        
        nameLabel.anchor(top: helloLabel.bottomAnchor,
                          leading: view.leadingAnchor,
                          trailing: view.trailingAnchor,
                          paddingTop: 5,
                         paddingLeading: 16)
        
        diagnosisView.anchor(top: nameLabel.bottomAnchor,
                               leading: view.leadingAnchor,
                               trailing:  view.trailingAnchor,
                               paddingTop: 24,
                               paddingLeading: 16,
                               paddingTrailing: 16)
        
        informationView.anchor(top: diagnosisView.bottomAnchor,
                                 leading: view.leadingAnchor,
                                 trailing: view.trailingAnchor,
                                 paddingTop: 15,
                                 paddingLeading: 16,
                                 paddingTrailing: 16)
        
        divider.anchor(top: informationView.bottomAnchor,
                       leading: view.leadingAnchor,
                       trailing: view.trailingAnchor,
                       paddingTop: 30)
        
        lawLabel.anchor(top: divider.bottomAnchor,
                        leading: view.leadingAnchor,
                        paddingTop: 24,
                        paddingLeading: 16)
        
        lawCollectionView.anchor(top: lawLabel.bottomAnchor,
                                 leading: view.leadingAnchor,
                                 trailing: view.trailingAnchor,
                                 paddingTop: 30,
                                 paddingLeading: 16,
                                 paddingTrailing: 16)
        lawCollectionView.setHeight(height: 100)
    }
    
    private func setLabel() {
        nameLabel.setLabel(labelText: "홍문치킨 사장님!", backgroundColor: .clear, weight: .semibold, textSize: 24, labelColor: .black)
        lawLabel.setLabel(labelText: "관련 법령 찾아보기", backgroundColor: .clear, weight: .semibold, textSize: 24, labelColor: .black)
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return laws.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KindCollectionViewCell.reuseIdentifier, for: indexPath) as? KindCollectionViewCell else { return UICollectionViewCell() }
        
        cell.categoryLabel.text = laws[indexPath.row].name
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 15
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
            
            // TODO: 해당 법령 페이지로 넘어가도록 구현
        }
    }
}
