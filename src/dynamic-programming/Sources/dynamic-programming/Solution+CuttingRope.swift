//
//  File.swift
//  
//
//  Created by liuzhuangzhuang01 on 2022/6/28.
//

import Foundation

extension Solution {
    enum CuttingRope {
        typealias Solution = (Int) -> Int
        
        static func byDynamicProgramming(_ n: Int) -> Int {
            if n < 3 { return n - 1 }
            var dp = [Int](repeating: 0, count: n + 1)
            dp[2] = 1
            for i in 3 ... n {
                for j in 1 ..< i - 1 {
                    dp[i] = max(dp[i], max(j * (i - j), j * dp[i - j]))
                }
            }
            return dp[n]
        }
        
        static func byMathmatic(_ n: Int) -> Int {
            if n <= 3 { return n - 1 }
            let a = n / 3, b = n % 3
            if b == 0 { return Int(truncating: NSDecimalNumber(decimal: pow(3, a))) }
            if b == 1 { return Int(truncating: NSDecimalNumber(decimal: pow(3, a - 1) * 4)) }
            return Int(truncating: NSDecimalNumber(decimal: pow(3, a) * 2))
        }
        
        static func byFindInLookupTable(_ n: Int) -> Int {
            [0, 0, 1, 2, 4, 6, 9, 12, 18, 27, 36, 54, 81, 108, 162, 243, 324, 486, 729, 972, 1458, 2187, 2916, 4374, 6561, 8748, 13122, 19683, 26244, 39366, 59049, 78732, 118098, 177147, 236196, 354294, 531441, 708588, 1062882, 1594323, 2125764, 3188646, 4782969, 6377292, 9565938, 14348907, 19131876, 28697814, 43046721, 57395628, 86093442, 129140163, 172186884, 258280326, 387420489, 516560652, 774840978, 1162261467, 1549681956][n]
        }
        
    }
}
