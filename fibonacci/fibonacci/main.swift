//
//  main.swift
//  fibonacci
//
//  Created by 노영재 on 2023/01/02.
//

import Foundation

let N = Int(readLine()!)!

var dp = [Int](repeating: -1, count: N)
func fibonacci(_ n : Int) -> Int {
    if n == 0 { return 0 }
    if n == 1 { return 1 }
    
    if dp[n - 1] != -1 { return dp[n - 1]}
    else {
        dp[n - 1] = fibonacci(n - 1) + fibonacci(n - 2)
    }
    
    return dp[n - 1]
}

var dp2 = [Int](repeating: 0, count: N + 3)
dp2[1] = 1
func fibonacci2(_ n : Int) -> Int {
    for i in 0...n {
        dp2[i + 2] += dp2[i]
        dp2[i + 1] += dp2[i]
    }
    return dp2[n]
}

print(fibonacci(N), dp)
print(fibonacci2(N), dp2)

