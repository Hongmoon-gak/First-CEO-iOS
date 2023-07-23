//
//  Law.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/23.
//

import Foundation

struct Law {
    var name: String
    // TODO: 로직 생성할 때 필요한 프로퍼티 추가하기
}

extension Law {
    static let laws = [
        Law(name: "4대보험"),
        Law(name: "근로계약"),
        Law(name: "근로환경"),
        Law(name: "임금")
    ]
}
