//
//  main.swift
//  no.2749
//
//  Created by 노영재 on 2023/05/12.
//

import Foundation

let N = Int(readLine()!)!

var dp = [Int](repeating: 0, count: 1500050)
dp[1] = 1
for i in 0..<1500000 {
    dp[i + 2] = (dp[i] + dp[i + 1])%1000000
}

print(dp[N%1500000])
