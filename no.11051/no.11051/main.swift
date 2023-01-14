//
//  main.swift
//  no.11051
//
//  Created by 노영재 on 2023/01/13.
//

import Foundation

let read = readLine()!.split(separator: " ").map{ Int($0)! }

let N = read[0]
let K = read[1]

let MAX = 1001

var dp = [[Int]](repeating: [Int](repeating: 0, count: MAX), count: MAX)
dp[0][0] = 1

for i in 0...N {
    for j in 0...i {
        if j == 0 {
            dp[i][0] = 1
        } else if j == i {
            dp[i][j] = 1
        } else {
            dp[i][j] = (dp[i - 1][j] + dp[i - 1][j - 1])%10007
        }
    }
}

print(dp[N][K]%10007)
