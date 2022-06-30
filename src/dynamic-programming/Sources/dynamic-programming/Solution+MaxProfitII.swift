//
//  File.swift
//  
//
//  Created by zhzh liu on 2022/6/29.
//

import Foundation

extension Solution {
    enum MaxProfitII {
        typealias Solution = ([Int]) -> Int

        static func simple(_ prices: [Int]) -> Int {
            if prices.isEmpty { return 0 }
            var profit = 0
            for i in 1..<prices.count {
                let income = prices[i] - prices[i - 1]
                if income > 0 { profit += income }
            }
            return profit
        }

        /// 动态规划
        static func dp(_ prices: [Int]) -> Int {
            if prices.count < 2 { return 0 }
            var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: prices.count)
            dp[0][0] = 0
            dp[0][1] = -prices[0]
            for i in 1 ..< prices.count {
                // 第i天持有现金的收益
                dp[i][0] = max(
                    dp[i - 1][0], /* 继续持有 i-1 天的现金收益 */
                    dp[i - 1][1] + prices[i] /* 将持有的股票在第i天卖出 */
                )
                // 第i填持有股票的收益
                dp[i][1] = max(
                    dp[i - 1][1], /* 继续持有第i-1天的股票 */
                    dp[i - 1][0] - prices[i] /* 用i-1天的现金收益，买入第i天的股票，股价为prices[i]*/
                )
            }
            // 最大收益一定是最后一天手中持有现金
            return dp[prices.count - 1][0]
        }

        static func dpWithMemOptimal(_ prices: [Int]) -> Int {
            if prices.count < 2 { return 0 }
            var cash = 0
            var hold = -prices[0]
            for i in 1 ..< prices.count {
                cash = max(cash, hold + prices[i])
                hold = max(hold, cash - prices[i])
            }
            return cash
        }
    }
}
