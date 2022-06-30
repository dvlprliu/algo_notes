//
//  File.swift
//  
//
//  Created by zhzh liu on 2022/6/30.
//

import Foundation

extension Solution {
    enum MaxProfitIII {
        typealias Solution = ([Int]) -> Int

        static func dp(_ prices: [Int]) -> Int {
            if prices.count < 2 { return 0 }
            
            return -1
        }
    }
}
