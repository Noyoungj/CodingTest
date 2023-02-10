//
//  main.swift
//  no.9252
//
//  Created by 노영재 on 2023/02/10.
//

import Foundation

let str1 = readLine()!.map{ String($0) }
let str2 = readLine()!.map{ String($0) }

var dp = [[Int]](repeating: [Int](repeating: 0, count: str1.count + 1), count: str2.count + 1)

for i in 1...str2.count {
    for j in 1...str1.count {
        if str2[i - 1] == str1[j - 1] {
            dp[i][j] = dp[i - 1][j - 1] + 1
        } else {
            dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
        }
    }
}

var result : [String] = []

func solve(_ y: Int, _ x: Int) {
    if dp[y][x] == 0 {
        return
    }
    
    if str2[y - 1] == str1[x - 1] {
        solve(y - 1, x - 1)
        result.append(str2[y - 1])
    } else {
        dp[y - 1][x] > dp[y][x - 1] ? solve(y - 1, x) : solve(y, x - 1)
    }
}

solve(str2.count, str1.count)
print(result.count)
print(result.joined())
