//
//  main.swift
//  no.9095
//
//  Created by 노영재 on 2023/01/16.
//

import Foundation

let read = Int(readLine()!)!
let MAX = 11

var result : [Int] = []

for _ in 1...read {
    let N = Int(readLine()!)!
    
    var dp = [Int](repeating: -1, count: MAX)
    dp[1] = 1
    dp[2] = 2
    dp[3] = 4
    
    if N > 3 {
        for i in 4...N {
            dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]
        }
    }
    result.append(dp[N])
}

for i in 0..<read {
    print(result[i])
}
