/*
 * @lc app=leetcode.cn id=75 lang=swift
 *
 * [75] 颜色分类
 */

// @lc code=start
extension Solution {
    func sortColors(_ nums: inout [Int]) {
        guard nums.count > 1 else { return }
        let maxElement = nums.max() ?? 0
        var countArray = [Int](repeating: 0, count: maxElement + 1)
        for i in nums {
            countArray[i] += 1
        }

        for index in 1 ..< countArray.count {
            let sum = countArray[index - 1] + countArray[index]
            countArray[index] = sum
        }

        var sortedNums = nums
        for element in nums {
            countArray[element] -= 1
            sortedNums[countArray[element]] = element
        }
        nums = sortedNums
    }
}
// @lc code=end

