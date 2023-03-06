//
//  main.swift
//  no.11570
//
//  Created by 노영재 on 2023/02/14.
//

import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int($0)! }
arr = [0] + arr
var dp = [[Int]](repeating: [Int](repeating: Int.max, count: N + 1), count: N + 1)
dp[0][0] = 0
dp[1][0] = arr[1]
for i in 0...N {
    for j in i...N {
        

        if i == j {
            dp[i][j] = dp[0][j]
            continue
        }
        
        if i == 0{
            dp[i][j] = dp[i][j - 1] + arr[j]
            continue
        }
        

        dp[i][j] = min(dp[i][j], dp[i][j - 1] + abs(arr[j] - arr[j - 1]))
        dp[i][j] = min(dp[i][j], dp[i - 1][j] + abs(arr[i] - arr[i - 1]))
    }
}

print(dp)
