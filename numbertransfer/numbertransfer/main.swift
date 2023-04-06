//
//  main.swift
//  numbertransfer
//
//  Created by 노영재 on 2023/04/06.
//

import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    let MAX = 1000001
    var dp = [Int](repeating: Int.max - 1, count: MAX)
    dp[x] = 0
    for i in x...y {
        if i + n < y + 1 {
            dp[i + n] = min(dp[i] + 1, dp[i + n])
        }
        
        if i * 2 <  y + 1 {
            dp[i * 2] = min(dp[i] + 1, dp[2 * i])
        }
        
        if i * 3 <  y + 1 {
            dp[3 * i] = min(dp[i] + 1, dp[3 * i])
        }
    }
    
    var answer = 0
    if dp[y] == Int.max - 1 {
        answer = -1
    } else {
        answer = dp[y]
    }
    
    return answer
}
