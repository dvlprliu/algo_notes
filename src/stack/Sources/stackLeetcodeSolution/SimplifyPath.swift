//
//  SimplifyPath.swift
//  stack
//
//  Created by zhzh liu on 3/22/20.
//

import Foundation

extension Solution {
    func simplifyPath(_ path: String) -> String {
        var stack = [String]()
        for element in path.split(separator: "/") {
            if element == "." || element == "" {
                continue
            } else if element == ".." {
                _ = stack.popLast()
            } else {
                stack.append(String(element))
            }
        }
        return "/" + stack.joined(separator: "/")
    }
}
