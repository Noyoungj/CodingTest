//
//  main.swift
//  no.1562
//
//  Created by 노영재 on 2023/02/12.
//

import Foundation

let N = Int(readLine()!)!
let MAX = 1000000000

var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 2000), count: 10), count: N + 1)

for i in 1...9 {
    dp[1][i][1<<i] = 1
}

if N > 1 {
    for i in 2...N {
        for j in 0...9 {
            let a = 1 << j
            for k in 1...1023 {
                if j == 0 {
                    dp[i][j][k|a] += dp[i - 1][j + 1][k]
                } else if j == 9 {
                    dp[i][j][k|a] += dp[i - 1][j - 1][k]
                } else {
                    dp[i][j][k|a] += (dp[i - 1][j - 1][k] + dp[i - 1][j + 1][k])
                }
                dp[i][j][ k|a ] %= MAX
            }
        }
    }
}

var sum = 0

for i in 0...9 {
    sum += dp[N][i][1023]
}

print(sum%MAX)
