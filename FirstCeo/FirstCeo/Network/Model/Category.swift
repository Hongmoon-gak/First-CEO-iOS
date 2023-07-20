//
//  Kind.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/20.
//

import Foundation

struct Category {
    var name: String
    var isCategorySelected: Bool
}

extension Category {
    static let categoryNames = [
        Category(name: "서비스", isCategorySelected: false),
        Category(name: "도/소매", isCategorySelected: false),
        Category(name: "숙박/음식점", isCategorySelected: false),
        Category(name: "교육서비스", isCategorySelected: false),
        Category(name: "정보통신", isCategorySelected: false),
        Category(name: "부동산", isCategorySelected: false),
        Category(name: "전기/가스", isCategorySelected: false),
        Category(name: "수도/하수", isCategorySelected: false),
        Category(name: "운송/창고", isCategorySelected: false),
        Category(name: "보건/사회복지", isCategorySelected: false),
        Category(name: "예술/스포츠", isCategorySelected: false),
        Category(name: "농/임/어업", isCategorySelected: false),
        Category(name: "제조업", isCategorySelected: false),
        Category(name: "건설", isCategorySelected: false),
        Category(name: "기타", isCategorySelected: false)
    ]
}
