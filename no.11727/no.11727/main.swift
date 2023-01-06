//
//  main.swift
//  no.11727
//
//  Created by 노영재 on 2023/01/06.
//

import Foundation

let N = Int(readLine()!)!
let MAX = 1001
var array = [Int](repeating: 1, count: MAX)

if N > 1 {
    for i in 2...N {
        if i%2 == 0 {
            array[i] = (array[i - 1] * 2 + 1)%10007
        } else {
            array[i] = (array[i - 1] * 2 - 1)%10007
        }
    }
}

print(array[N])
