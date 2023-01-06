//
//  main.swift
//  no.1904
//
//  Created by 노영재 on 2023/01/06.
//

import Foundation

let N = Int(readLine()!)!
let Max = 1000001
var array = [Int](repeating: 1, count: Max)
array[1] = 2

if N > 1 {
    for i in 2...N {
        array[i] = (array[i - 2] + array[i - 1])%15746
    }
}
    

print(array[N - 1])
