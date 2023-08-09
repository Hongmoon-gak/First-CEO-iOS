//
//  Law.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/23.
//

import Foundation

struct Law {
    var name: String
    var imageName: String
    var labeledImageName: String
    var selectedImageName: String
    var selectedLabeledImageName: String
    // TODO: 로직 생성할 때 필요한 프로퍼티 추가하기
}

extension Law {
    static let laws = [
        Law(name: "4대보험", imageName: "insurance.png", labeledImageName: "insurance-label.png", selectedImageName: "insurance-selected.png", selectedLabeledImageName: "insurance-label-selected.png"),
        Law(name: "근로계약", imageName: "contract.png", labeledImageName: "contract-label.png", selectedImageName: "contract-selected.png", selectedLabeledImageName: "contract-label-selected.png"),
        Law(name: "급여", imageName: "pay.png", labeledImageName: "pay-label.png", selectedImageName: "pay-selected.png", selectedLabeledImageName: "pay-label-selected.png"),
        Law(name: "해고", imageName: "fire.png", labeledImageName: "fire-label.png", selectedImageName: "fire-selected.png", selectedLabeledImageName: "fire-label-selected.png")
    ]
}
