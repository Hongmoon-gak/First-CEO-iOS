//
//  InsuranceViewController.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/30.
//

import UIKit

class SegmentedControlViewController: UIViewController {
    
    // MARK: - Properties
    
    private var segmentedControl: UISegmentedControl = {
        let itemNames = Law.laws.map { $0.name }
        let labeledImages = Law.laws.map { $0.labeledImageName }
        let selectedItemImages = Law.laws.map { $0.selectedImageName }
        
        let segmentedControl = UISegmentedControl(items: itemNames)

        segmentedControl.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segmentedControl.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        segmentedControl.layer.backgroundColor = UIColor.white.cgColor

//        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.setImage(UIImage(named: "insurance-label-selected"), forSegmentAt: 0)
        segmentedControl.setImage(UIImage(named: "contract-label"), forSegmentAt: 1)
        segmentedControl.setImage(UIImage(named: "pay-label"), forSegmentAt: 2)
        segmentedControl.setImage(UIImage(named: "fire-label"), forSegmentAt: 3)
        
        segmentedControl.addTarget(self, action: #selector(tappedSegmentedControl(_:)), for: .valueChanged)
        
        return segmentedControl
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        let contentLayoutGuide = scrollView.contentLayoutGuide
        let frameLayoutGuide = scrollView.frameLayoutGuide
        
        scrollView.backgroundColor = .clear
        scrollView.accessibilityScroll(.down)
        scrollView.isScrollEnabled = true
        
        return scrollView
    }()
    
    
    private lazy var insuranceView = InsuranceView()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        [segmentedControl, scrollView].forEach { view.addSubview($0) }
        scrollView.addSubview(insuranceView)
        configureLayout()
    }
    
    private func configureLayout() {
        
        segmentedControl.centerX(inView: view)
        segmentedControl.anchor(top: view.topAnchor, paddingTop: 100)
        segmentedControl.setHeight(height: 85)
        
        scrollView.anchor(top: segmentedControl.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, paddingTop: 12)
        
        insuranceView.anchor(leading: scrollView.frameLayoutGuide.leadingAnchor, trailing: scrollView.frameLayoutGuide.trailingAnchor)
        insuranceView.setHeight(height: 1029)
        
        insuranceView.anchor(top: scrollView.contentLayoutGuide.topAnchor, leading: scrollView.contentLayoutGuide.leadingAnchor, bottom: scrollView.contentLayoutGuide.bottomAnchor, trailing: scrollView.contentLayoutGuide.trailingAnchor)
        
//        insuranceView.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor)
    }
    
    @objc func tappedSegmentedControl(_ segmentedControl: UISegmentedControl) {
        
        switch (segmentedControl.selectedSegmentIndex) {
            case 0:
                insuranceView.isHidden = false
                segmentedControl.setImage(UIImage(named: "insurance-label-selected"), forSegmentAt: 0)
                segmentedControl.setImage(UIImage(named: "contract-label"), forSegmentAt: 1)
                segmentedControl.setImage(UIImage(named: "pay-label"), forSegmentAt: 2)
                segmentedControl.setImage(UIImage(named: "fire-label"), forSegmentAt: 3)
                break
            case 1:
                segmentedControl.setImage(UIImage(named: "insurance-label"), forSegmentAt: 0)
                segmentedControl.setImage(UIImage(named: "contract-label-selected"), forSegmentAt: 1)
                segmentedControl.setImage(UIImage(named: "pay-label"), forSegmentAt: 2)
                segmentedControl.setImage(UIImage(named: "fire-label"), forSegmentAt: 3)
                break
            case 2:
                segmentedControl.setImage(UIImage(named: "insurance-label"), forSegmentAt: 0)
                segmentedControl.setImage(UIImage(named: "contract-label"), forSegmentAt: 1)
                segmentedControl.setImage(UIImage(named: "pay-label-selected"), forSegmentAt: 2)
                segmentedControl.setImage(UIImage(named: "fire-label"), forSegmentAt: 3)
                break
            case 3:
                segmentedControl.setImage(UIImage(named: "insurance-label"), forSegmentAt: 0)
                segmentedControl.setImage(UIImage(named: "contract-label"), forSegmentAt: 1)
                segmentedControl.setImage(UIImage(named: "pay-label"), forSegmentAt: 2)
                segmentedControl.setImage(UIImage(named: "fire-label-selected"), forSegmentAt: 3)
                break
            default:
                break
        }
    }
}
