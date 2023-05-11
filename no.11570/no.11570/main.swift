//
//  main.swift
//  no.11570
//
//  Created by 노영재 on 2023/02/14.
//

import Foundation

let N = Int(readLine()!)!
var arr = [0] + readLine()!.split(separator: " ").map{ Int($0)! }

var dp = [[Int]](repeating: [Int](repeating: Int.max, count: N + 1), count: N + 1)

dp[0][1] = 0
dp[1][0] = 0

for i in 0...N {
    for j in 0...N {
        if i == j { continue }
        
        let next = max(i, j) + 1
        
        if next > N { continue }
        
        if i == 0 || j == 0 { arr[0] = arr[next] }
        
        dp[next][j] = min(dp[next][j], dp[i][j] + abs(arr[next] - arr[i]))
        dp[i][next] = min(dp[i][next], dp[i][j] + abs(arr[next] - arr[j]))
    }
}

var result = Int.max

for i in 0...N {
    result = min(result, dp[i][N])
    result = min(result, dp[N][i])
}

print(result)
