//
//  main.swift
//  no.11057
//
//  Created by 노영재 on 2023/01/13.
//

import Foundation

let N = Int(readLine()!)!
let MAX = 1001

var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: MAX)

for i in 0...9 {
    dp[1][i] = 1
}

if N > 1 {
    for i in 2...N {
        for j in 0...9 {
            for k in 0...j {
                dp[i][j] += (dp[i-1][j-k])%10007
            }
        }
    }
}

var result = 0
for i in 0...9 {
    result += dp[N][i]
}

print((result)%10007)
