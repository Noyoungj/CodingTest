//
//  main.swift
//  1644
//
//  Created by 노영재 on 2023/04/28.
//

import Foundation

let N = Int(readLine()!)!
var dp = [Int](repeating: 0, count: N + 1)

for i in 1...N {
    dp[i] = i
}

dp[1] = 0
for i in 1...N {
    if dp[i] == 0 { continue }
    
    for j in stride(from: i + i, to: N + 1, by: i) {
        dp[j] = 0
    }
}
dp = dp.filter{ $0 != 0 }

var l = 0
var r = 0
var sum = 0
var result = 0

while true {
    if sum >= N {
        sum -= dp[l]
        l += 1
    } else if r == dp.count { break }
    else {
        sum += dp[r]
        r += 1
    }
    
    if sum == N {
        result += 1
    }
}

print(result)
