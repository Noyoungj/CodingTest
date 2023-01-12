//
//  main.swift
//  no.10844
//
//  Created by 노영재 on 2023/01/12.
//

import Foundation

let N = Int(readLine()!)!
let MAX = 101
let n = 1000000000

var dp = [[Int]](repeating: [Int](repeating: 0, count: 10), count: MAX)

for i in 0...9 {
    dp[1][i] = 1
}

if N > 1 {
    for i in 2...N {
        for j in 0...9 {
            if j == 0 {
                dp[i][j] = dp[i - 1][1]
            } else if j == 9 {
                dp[i][j] = dp[i - 1][8]
            } else {
                dp[i][j] = (dp[i - 1][j - 1] + dp[i - 1][j + 1])%n
            }
        }
    }
}
var result = 0
for i in 1...9 {
    result += dp[N][i]
}
print(result%n)
