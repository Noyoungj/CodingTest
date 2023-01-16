//
//  main.swift
//  no.2579
//
//  Created by 노영재 on 2023/01/16.
//

import Foundation

let N = Int(readLine()!)!
let MAXN = 301
var arr = [Int](repeating: 0, count: MAXN)
for i in 1...N {
    arr[i] = Int(readLine()!)!
}

var dp = [Int](repeating: 0, count: MAXN)

dp[1] = arr[1]
dp[2] = arr[2] + arr[1]
dp[3] = max(arr[3] + arr[2], arr[3] + arr[1])
if N > 3 {
    for i in 4...N {
        dp[i] = max(dp[i - 2] + arr[i], dp[i - 3] + arr[i] + arr[i - 1])
    }
}


print(dp[N])
