//
//  File.swift
//  
//
//  Created by zhzh liu on 2022/6/28.
//

import Foundation

public struct Case<Parameter, Expect: Equatable> {
    public let parameter: Parameter
    public let expect: Expect

    public init(parameter: Parameter, expect: Expect) {
        self.parameter = parameter
        self.expect = expect
    }
}

