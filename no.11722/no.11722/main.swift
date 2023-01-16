//
//  main.swift
//  no.11722
//
//  Created by 노영재 on 2023/01/17.
//

import Foundation

let MAX = 1001

let N = Int(readLine()!)!

let read = readLine()!.split(separator: " ").map{ Int(String($0))! }
var arr = [Int](repeating: 0, count: MAX)
for i in 1...N {
    arr[i] = read[i - 1]
}

var dp = [Int](repeating: 0, count: MAX)

    for i in 1...N {
        dp[i] = 1
        for j in 1...i {
            if arr[i] >= arr[j] {
                continue
            } else {
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
    }


print(dp.max()!)

