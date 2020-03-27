//
//  DailyTemperatures.swift
//  stackPackageDescription
//
//  Created by zhzh liu on 3/22/20.
//

import Foundation

extension Solution {
    func dailyTemperatures(_ temps: [Int]) -> [Int] {
        var days = [Int](repeating: 0, count: temps.count)
        var stack = [Int]()
        for i in 0..<temps.count {
            while let top = stack.last, temps[i] > temps[top] {
                let t = stack.removeLast()
                days[t] = i - t
            }
            stack.append(i)
        }
        return days
    }
}
