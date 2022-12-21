//
//  main.swift
//  no.2212
//
//  Created by 노영재 on 2022/12/21.
//

import Foundation

let N = Int(readLine()!)!
let K = Int(readLine()!)!

var array : [Int] = []
array = readLine()!.split(separator: " ").map{ Int($0)! }
array.sort()

var gap : [Int] = []

for i in 0..<array.count - 1 {
    gap.append(array[i + 1] - array[i])
}
gap.sort()

var result = 0

if N > K {
    for i in 0..<(N - K) {
        result += gap[i]
    }
}

print(result)
