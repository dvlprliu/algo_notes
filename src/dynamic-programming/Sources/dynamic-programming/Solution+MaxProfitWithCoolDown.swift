//
//  File.swift
//  
//
//  Created by zhzh liu on 2022/6/30.
//

import Foundation

extension Solution {
    enum MaxProfitWithCoolDown {
        typealias Soltuion = ([Int]) -> Int

        static func dp(_ prices: [Int]) -> Int {
            if prices.count < 2 { return 0 }
            var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: prices.count)
            dp[0][0] = -prices[0]
            // dp[i][0] 表示持股的累积最大收益
            // dp[i][1] 没有持股，在冷冻期, 说明i-1天卖掉了股票
            // dp[i][2] 没有持股，没有在冷冻期
            for i in 1 ..< prices.count {
                dp[i][0] = max(dp[i - 1][0], dp[i - 1][2] - prices[i])
                dp[i][1] = dp[i - 1][0] + prices[i]
                dp[i][2] = max(dp[i - 1][1], dp[i - 1][2])
            }
            return max(dp[prices.count - 1][1], dp[prices.count - 1][2])
        }

        static func dpWithMemOpt(_ prices: [Int]) -> Int {
            if prices.count < 2 { return 0 }
            var dp: (Int, Int, Int) = (-prices[0], 0, 0)
            for i in 1 ..< prices.count {
                let dp0 = max(dp.0, dp.2 - prices[i])
                let dp1 = dp.0 + prices[i]
                let dp2 = max(dp.1, dp.2)
                dp = (dp0, dp1, dp2)
            }
            return max(dp.1, dp.2)
        }
    }
}
