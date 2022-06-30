//
//  File.swift
//  
//
//  Created by zhzh liu on 2022/6/30.
//

import Foundation

extension Solution {
    enum MaxProfitWithFee {
        typealias Solution = ([Int], Int) -> Int

        static func dp(_ prices: [Int], fee: Int) -> Int {
            if prices.count < 2 { return 0 }
            var cash = 0
            var hold = -prices[0]
            for i in 1 ..< prices.count {
                // 不持股的累积最大收益等于
                cash = max(cash, hold + prices[i] - fee)
                hold = max(hold, cash - prices[i])
            }
            return cash
        }

        static func dpWithMemOptimal(_ prices: [Int], fee: Int) -> Int {
            if prices.count < 2 { return 0 }
            var dp: (Int, Int) = (0, -prices[0])
            for i in 1 ..< prices.count {
                let dp0 = max(dp.0, dp.1 + prices[i] - fee)
                let dp1 = max(dp.1, dp.0 - prices[i])
                dp = (dp0, dp1)
            }
            return dp.0
        }
    }
}
