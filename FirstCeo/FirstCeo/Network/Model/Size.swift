//
//  Size.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/21.
//

import Foundation

struct Size {
    var range: String
    var isSizeSelected: Bool
}

extension Size {
    static let sizeRanges = [
        Size(range: "1~4인", isSizeSelected: false),
        Size(range: "5~29인", isSizeSelected: false),
        Size(range: "30인 이상", isSizeSelected: false)
    ]
}
