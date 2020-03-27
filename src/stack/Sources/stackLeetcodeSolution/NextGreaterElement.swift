//
//  NextGreaterElement.swift
//  stackPackageDescription
//
//  Created by zhzh liu on 3/22/20.
//

import Foundation

extension Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict = [Int: Int]()
        var stack = [Int]()
        for n in nums2 {
            while let top = stack.last, n > top {
                dict[stack.removeLast()] = n
            }
            stack.append(n)
        }
        return nums1.map { dict[$0] ?? -1 }
    }
}
