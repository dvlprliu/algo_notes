//
//  File.swift
//  
//
//  Created by zhzh liu on 2022/6/28.
//

import Foundation

extension Solution {
    enum MaxProfitI {
        typealias Solution = ([Int]) -> Int

        static func simple(_ prices: [Int]) -> Int {
            if prices.isEmpty { return 0 }
            var max = Int.min
            for i in 0..<prices.count {
                for j in i..<prices.count {
                    let profit = prices[j] - prices[i]
                    max = Swift.max(profit, max)
                }
            }
            return max
        }

        // 这是一个错误解，无法满足case: [2, 4, 1]
        static func simpleII(_ prices: [Int]) -> Int {
            if prices.isEmpty { return 0 }
            var min = Int.max
            var indice: [Int: Int] = [:]
            for i in 0..<prices.count {
                min = Swift.min(prices[i], min)
                indice[prices[i]] = i
            }
            guard let minIdx = indice[min] else {
                return 0
            }
            var max = Int.min
            for i in minIdx..<prices.count {
                max = Swift.max(max, prices[i])
            }
            guard let maxIdx = indice[max] else {
                return 0
            }
            return Swift.max(0, max - min)
        }

        static func dp(_ prices: [Int]) -> Int {
            if prices.isEmpty { return 0 }
            var maxProfit = 0
            var min = prices[0]
            for price in prices {
                maxProfit = max(maxProfit, price - min)
                min = Swift.min(min, price)
            }
            return maxProfit
        }
    }
}
