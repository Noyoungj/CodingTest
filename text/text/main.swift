//
//  main.swift
//  text
//
//  Created by 노영재 on 2023/03/16.
//

import Foundation

import Foundation

// 최적화는 시킨 듯 한데, 문제 풀이 방식이 효율적이지 않은 듯?

func solution(_ n: Int) -> Int {
    var dp = [Int](repeating: 0, count: Int(sqrt(Double(n))) + 1)
    print(dp.count)
    for i in 1...(Int(sqrt(Double(n))) + 1) {
        dp[i] = i // 초기화
        for j in 1...Int(sqrt(Double(i))) {
            print(i, j)
            dp[j] = min(dp[j], dp[i - j*j] + 1)
        }
    }
    print(dp)
    return dp[Int(sqrt(Double(n)))]
}

print(solution(9))


