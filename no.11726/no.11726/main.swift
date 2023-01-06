//
//  main.swift
//  no.11726
//
//  Created by 노영재 on 2023/01/06.
//

import Foundation

let N = Int(readLine()!)!
let MAX = 1001
var array = [Int](repeating: 1, count: MAX)
array[1] = 2

if N > 1 {
    for i in 2...N {
        array[i] = (array[i - 1] + array[i - 2])%10007
    }
}

print(array[N - 1])
