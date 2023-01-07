//
//  main.swift
//  no.1699
//
//  Created by 노영재 on 2023/01/07.
//

import Foundation

let N = Int(readLine()!)!
let MAX = 100001

var dp = [Int](repeating: 0, count: MAX)


for i in 1...N {
    dp[i] = i
    
    for j in 1...i {
        if i < j * j {
            break
        }
        
        if dp[i] > dp[i - (j * j)] {
            dp[i] = dp[i - (j * j)] + 1
        }
    }
}

print(dp[N])
