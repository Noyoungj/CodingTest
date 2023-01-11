//
//  main.swift
//  no.11052
//
//  Created by 노영재 on 2023/01/11.
//

import Foundation

let N = Int(readLine()!)!

var arr = readLine()!.split(separator: " ").map{ Int($0)! }
var dp = [Int](repeating: 0, count: 1001)

for i in 1...N {
    for j in 1...i {
        dp[i] = max(dp[i], dp[i - j] + arr[j - 1])
    }
}

if N == 1 {
    print(arr[0])
} else {
    print(dp[N])
}
