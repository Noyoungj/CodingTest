//
//  main.swift
//  no.11055
//
//  Created by 노영재 on 2023/01/16.
//

import Foundation

let N = Int(readLine()!)!

var array = readLine()!.split(separator: " ").map{ Int($0)! }
let MAX = 1001
let arr = [0] + array
var dp = [Int](repeating: 0, count: N + 1)
for i in 1...N {
    dp[i] = arr[i]
}
for i in 1...N {
    for j in 1..<i {
        if arr[i] > arr[j] {
            dp[i] = max(dp[i], dp[j] + arr[i])
        }
    }
}

print(dp)
