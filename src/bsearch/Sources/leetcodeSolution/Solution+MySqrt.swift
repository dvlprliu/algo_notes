//
//  Solution+MySqrt.swift
//  bsearch
//
//  Created by zhzh liu on 3/6/20.
//

import Foundation

extension Solution {
    func mySqrt(_ x: Int) -> Int {
        var low = 0
        var high = x
        while low <= high {
            let mid = low + (high - low) / 2
            let target = mid * mid
            if target <= x {
                if mid == x / 2 || (mid + 1) * (mid + 1) > x {
                    return mid
                }
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return low
    }
}
