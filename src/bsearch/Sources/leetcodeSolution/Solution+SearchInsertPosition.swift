//
//  Solution+SearchInsertPosition.swift
//  bsearch
//
//  Created by zhzh liu on 3/6/20.
//

import Foundation

extension Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        let len = nums.count
        if len == 0 {
            return 0
        }
        if target > nums[len - 1] {
            return len
        }
        var low = 0
        var high = len - 1
        while low < high {
            let mid = low + ((high - low) / 2)
            if nums[mid] < target {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return low
    }
}
