//
//  main.swift
//  no.2748
//
//  Created by 노영재 on 2023/01/16.
//

import Foundation

let N = Int(readLine()!)!
let MAX = 91
var dp = [Int](repeating: 0, count: MAX)

dp[1] = 1

if N > 1 {
    for i in 2...N {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
}

print(dp[N])
