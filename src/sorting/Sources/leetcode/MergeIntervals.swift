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
        while i <= intervals.count - 1 {
            var j = i
            while j < intervals.count - 1 {
                if intervals[j][1] >= intervals[j+1][0] {
                    j += 1
                } else {
                    break
                }
            }
            // 合并
            let lower = min(intervals[i][0], intervals[j][0])
            let upper = max(intervals[i][1], intervals[j][1])
            let merged = [lower, upper]
            result.append(merged)
            i = j + 1
        }
        return result
    }
}
// @lc code=end
