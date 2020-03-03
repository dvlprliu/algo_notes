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

    func sortColors_dutchFlag(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }

        var p0 = 0, cur = 0, p2 = nums.count - 1
        while cur <= p2 {
            if nums[cur] == 0 {
                nums.swapAt(cur, p0)
                p0 += 1
                cur += 1
            } else if nums[cur] == 2 {
                nums.swapAt(cur, p2)
                p2 -= 1
            } else {
                cur += 1
            }
        }
    }
}
// @lc code=end

