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
        nameLabel.setLabel(labelText: "홍문치킨 사장님!", isBold: true, textSize: 24, labelColor: .black)
        lawLabel.setLabel(labelText: "관련 법령 찾아보기", isBold: true, textSize: 20, labelColor: .black)
    }
}

