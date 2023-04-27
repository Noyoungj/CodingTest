//
//  main.swift
//  no.2096
//
//  Created by 노영재 on 2023/04/27.
//

import Foundation

let N = Int(readLine()!)!

var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: N)
var arr = [[Int]](repeating: [], count: N)
for i in 0..<N {
    arr[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
}

dp[0] = arr[0]

for i in 1..<N {
    dp[i][0] = min(dp[i - 1][0], dp[i - 1][1]) + arr[i][0]
    dp[i][1] = min(dp[i - 1][0], dp[i - 1][1], dp[i - 1][2]) + arr[i][1]
    dp[i][2] = min(dp[i - 1][1], dp[i - 1][2]) + arr[i][2]
}

let mn = dp[N - 1].min()!

dp[0] = arr[0]

for i in 1..<N {
    dp[i][0] = max(dp[i - 1][0], dp[i - 1][1]) + arr[i][0]
    dp[i][1] = max(dp[i - 1][0], dp[i - 1][1], dp[i - 1][2]) + arr[i][1]
    dp[i][2] = max(dp[i - 1][1], dp[i - 1][2]) + arr[i][2]
}

let mx = dp[N - 1].max()!

print(mx, mn)
