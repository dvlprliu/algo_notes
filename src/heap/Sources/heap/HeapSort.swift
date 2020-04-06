//
//  HeapSort.swift
//  heap
//
//  Created by zhzh liu on 4/6/20.
//

import Foundation

public func heapsort<T>(_ a: [T], sort: @escaping (T, T) -> Bool) -> [T] {
    let reverseOrder = { t1, t2 in sort(t2, t1) }
    var h = Heap(array: a, sort: reverseOrder)
    return h.sort()
}
