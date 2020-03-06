//
//  Solution+MySqrt.swift
//  bsearch
//
//  Created by zhzh liu on 3/6/20.
//

import Foundation

extension Solution {
    func mySqrt(_ x: Int) -> Int {
        if x == 0 { return 0 }
        var low = 1
        var high = x / 2
        while low < high {
            let mid = (low + high + 1) / 2
            let target = mid * mid
            if target > x {
                high = mid - 1
            } else {
                low = mid
            }
        }
        return low
    }
}
