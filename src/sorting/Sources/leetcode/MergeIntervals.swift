/*
 * @lc app=leetcode.cn id=56 lang=swift
 *
 * [56] 合并区间
 */

// @lc code=start
extension Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted { $0[0] < $1[0] }
        var i = 0
        var result = [[Int]]()
        while i < intervals.count {
            var j = i
            var merged = intervals[i]
            while j < intervals.count - 1 {
                if merged[1] >= intervals[j+1][0] {
                    merged = [merged[0], max(merged[1], intervals[j+1][1])]
                    j += 1
                } else {
                    break
                }
            }
            result.append(merged)
            i = j + 1
        }
        return result
    }
}
// @lc code=end
