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
    // TODO: 로직 생성할 때 필요한 프로퍼티 추가하기
}

extension Law {
    static let laws = [
        Law(name: "4대보험", imageName: "insurance.png"),
        Law(name: "근로계약", imageName: "contract.png" ),
        Law(name: "급여", imageName: "pay.png"),
        Law(name: "임금", imageName: "fire.png")
    ]
}
