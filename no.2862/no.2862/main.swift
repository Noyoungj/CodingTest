//
//  main.swift
//  no.2862
//
//  Created by 노영재 on 2023/05/12.
//

import Foundation

let N = Int(readLine()!)!

var dp = [Int](repeating: 0, count: 80)

dp[0] = 1
dp[1] = 2

for i in 2..<80 {
    dp[i] = dp[i - 1] + dp[i - 2]
}
var result = N
while !dp.contains(result) {
    let arr : [Int] = dp.filter{ $0 < result }
    result = result - arr[arr.count - 1]
}


print(result)
