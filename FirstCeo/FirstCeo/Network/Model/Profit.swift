//
//  Profit.swift
//  FirstCeo
//
//  Created by Lena on 2023/07/21.
//

import Foundation

struct Profit {
    var range: String
    var isProfitSelected: Bool
}

extension Profit {
    static let profitRanges = [
        Profit(range: "1억 미만", isProfitSelected: false),
        Profit(range: "1~10억 원", isProfitSelected: false),
        Profit(range: "10~100억 원", isProfitSelected: false),
        Profit(range: "100~200억 원", isProfitSelected: false),
        Profit(range: "200~300억 원", isProfitSelected: false),
        Profit(range: "300~1,000억 원", isProfitSelected: false),
        Profit(range: "10,000억 원 이상", isProfitSelected: false)
    ]
}
