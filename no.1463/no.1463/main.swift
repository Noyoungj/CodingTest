//
//  main.swift
//  no.1463
//
//  Created by 노영재 on 2023/01/03.
//

import Foundation

let N = Int(readLine()!)!
let max = 1000001
var dp = [Int](repeating: -1, count: max)
func solve(_ n : Int) -> Int {
    if n == 1 { return 0 }
    if dp[n] != -1 { return dp[n] }
    
    var result = solve(n - 1) + 1
    if(n%3 == 0) { result = min(result, solve(n/3) + 1)}
    if(n%2 == 0) { result = min(result, solve(n/2) + 1)}
    dp[n] = result
    
    return result
}


print(solve(N))
