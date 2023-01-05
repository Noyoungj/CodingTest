//
//  main.swift
//  no.2294
//
//  Created by 노영재 on 2023/01/05.
//

import Foundation

let read = readLine()!.split(separator: " ").map{ Int($0)! }
let N = read[0]
let K = read[1]

var arr : [Int] = []

for _ in 0..<N {
    arr.append(Int(readLine()!)!)
}

let N_MAX = 101
let K_MAX = 10001
let impossible = Int.max - 1
var dp = [[Int]](repeating: [Int](repeating: -1, count: K + 1), count: N + 1)

func solve(_ n : Int, _ k : Int) -> Int {
    if( n == N ) { return k == 0 ? 0 : impossible}
    if(dp[n][k] != -1) { return dp[n][k] }
    
    var result = solve(n + 1, k)
    if( k >= arr[n] ) { result = min(result, (solve(n, k - arr[n]) + 1))}
    dp[n][k] = result
    return result
}

let result = solve(0, K)
if result == (impossible) { print(-1) }
else { print(result) }
