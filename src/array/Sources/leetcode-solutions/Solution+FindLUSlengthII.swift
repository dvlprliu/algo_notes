//
//  File.swift
//  
//
//  Created by liuzhuangzhuang01 on 2022/6/27.
//

import Foundation

extension Solution {
    enum FindLUSlengthII {
        typealias Solution = ([String]) -> Int
        
        static func bySimple(_ strs: [String]) -> Int {
            var strArr = Array(strs)
            strArr.sort(by:{ $0.count > $1.count })
            for i in 0..<strArr.count {
                var check = true
                for j in 0..<strArr.count {
                    if  i == j  || strArr[i].count > strArr[j].count {
                        continue
                    }
                    if isSubseq(Array(strArr[i]), Array(strArr[j])) {
                        check = false
                    }
                }
                if check {
                    return strArr[i].count
                }
            }
            return -1
        }
        
        
        static func isSubseq(_ seq1: [Character], _ seq2: [Character]) -> Bool {
            var s1 = 0
            var s2 = 0
            while s1 < seq1.count && s2 < seq2.count {
                if seq1[s1] == seq2[s2] {
                    s1 += 1
                }
                s2 += 1
            }
            return s1 == seq1.count
        }
        
    }
}
