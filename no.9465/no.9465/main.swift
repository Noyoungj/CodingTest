//
//  main.swift
//  no.9465
//
//  Created by 노영재 on 2023/01/05.
//

import Foundation

let MAX = 100000
let read = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: -1, count: 3), count: MAX)
var N = 0
var array : [[Int]] = []
func solve(_ c: Int, _ status: Int) -> Int {
    if c == N { return 0 }
    if dp[c][status] != -1 { return dp[c][status] }
    
    var result = solve(c + 1, 0)
    if (status != 1) { result = max(result, solve(c + 1, 1) + array[0][c])}
    if (status != 2) { result = max(result, solve(c + 1, 2) + array[1][c])}
    dp[c][status] = result
    return result
}

var re : [Int] = []
for _ in 0..<read {
    N = Int(readLine()!)!
    array = [[Int]](repeating: [Int](repeating: 0, count: N), count: 2)
    
    for i in 0..<2 {
        array[i] = readLine()!.split(separator: " ").map{ Int($0)! }
    }
    re.append(solve(0, 0))
    dp = [[Int]](repeating: [Int](repeating: -1, count: 3), count: MAX)
}

for i in 0..<re.count {
    print(re[i])
}
