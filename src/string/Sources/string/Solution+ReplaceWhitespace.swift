//
//  File.swift
//  
//
//  Created by zhzh liu on 2022/6/25.
//

import Foundation

extension Solution {
    enum ReplaceWhitespace {

        typealias Solution = (String) -> String

        static func useStd(_ s: String) -> String {
            return s.replacingOccurrences(of: " ", with: "%20")
        }

        static func iterate(_ s: String) -> String {
            var newString = ""
            for char in s {
                if char.isWhitespace {
                    newString.append("%20")
                } else {
                    newString.append(String(char))
                }
            }
            return newString
        }
    }
}
