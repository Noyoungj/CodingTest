//
//  main.swift
//  no.15486
//
//  Created by 노영재 on 2023/01/18.
//

import Foundation

let N = Int(readLine()!)!
var arr = [[Int]](repeating: [Int](repeating: 0, count: 2), count: N + 2)

for i in 1...N {
    arr[i] = readLine()!.split(separator: " ").map{ Int($0)! }
}

var dp = [Int](repeating: 0, count: N + 2)

var cM = 0

for i in 1...(N + 1) {
    cM = max(cM, dp[i])
    if i + arr[i][0] > N + 1{
        continue
    }
    dp[i + arr[i][0]] = max(dp[i + arr[i][0]], cM + arr[i][1])
}

print(dp[N + 1])
