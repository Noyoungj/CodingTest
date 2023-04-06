//
//  main.swift
//  sisopartner
//
//  Created by 노영재 on 2023/04/06.
//

import Foundation

func solution(_ weights:[Int]) -> Int64 {
    let multi : [(Int, Int)] = [(3, 2), (4, 2), (4, 3)]
    var dp = [Int](repeating: 0, count: 1001)
    for i in weights {
        dp[i] += 1
    }
    var weight = Array(Set(weights))
    weight.sort()
    var answer = 0
    for i in weight {
        if dp[i] > 1 {
            answer += (dp[i] * (dp[i] - 1))/2
        }
        
        for j in multi {
            let now = Float(i * j.0)/Float(j.1)
            
            if (now) == floor(now) && now <= 1000 {
                if dp[Int(now)] >= 1 {
                    answer += dp[i] * dp[Int(now)]
                }
            }
        }
    }
    
    return Int64(answer)
}
