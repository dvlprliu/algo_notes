//
//  TopKFrequent.swift
//  leetcode
//
//  Created by zhzh liu on 4/6/20.
//
// 347. 前 K 个高频元素
// 给定一个非空的整数数组，返回其中出现频率前 k 高的元素。
//
// 示例 1:
//
// 输入: nums = [1,1,1,2,2,3], k = 2
// 输出: [1,2]
// 示例 2:
//
// 输入: nums = [1], k = 1
// 输出: [1]
// 说明：
//
// 你可以假设给定的 k 总是合理的，且 1 ≤ k ≤ 数组中不相同的元素的个数。
// 你的算法的时间复杂度必须优于 O(n log n) , n 是数组的大小。
//
// https://leetcode-cn.com/problems/top-k-frequent-elements/

import Foundation
import heap

extension Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        nums.forEach { (num) in
            dict[num, default: 0] += 1
        }
        var heap = Heap<Int> { n1, n2 in
            (dict[n1] ?? -1) < (dict[n2] ?? -1)
        }
        for key in dict.keys {
            heap.insert(key)
            if heap.count > k {
                heap.remove()
            }
        }
        var result = [Int]()
        while !heap.isEmpty {
            result.append(heap.remove() ?? -1)
        }
        return result.reversed()
    }
}


