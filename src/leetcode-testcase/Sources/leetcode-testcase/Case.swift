//
//  File.swift
//  
//
//  Created by zhzh liu on 2022/6/28.
//

import Foundation

open struct Case<Parameter, Expect: Equatable> {
    open let parameter: Parameter
    open let expect: Expect
}

