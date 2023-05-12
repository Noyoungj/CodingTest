//
//  main.swift
//  no.2618
//
//  Created by 노영재 on 2023/05/12.
//

import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!

var arr = [[Int]](repeating: [], count: M + 1)
for i in 1...M {
    arr[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
}
var dp = [[Int]](repeating: [Int](repeating: -1, count: M + 1 ), count: M + 1)
func DFS(_ p1: Int, _ p2: Int) -> Int {
    if p1 == M || p2 == M { return 0 }
    if dp[p1][p2] != -1 { return dp[p1][p2] }

    let nextE = max(p1,p2) + 1
    var d1 = 0
    var d2 = 0
    if p1 == 0 { d1 = findDist(1, 1, arr[nextE][0], arr[nextE][1]) }
    else { d1 = findDist(arr[p1][0], arr[p1][1], arr[nextE][0], arr[nextE][1]) }
    
    if p2 == 0 { d2 = findDist(N, N, arr[nextE][0], arr[nextE][1])}
    else { d2 = findDist(arr[p2][0], arr[p2][1], arr[nextE][0], arr[nextE][1]) }
    
    let result1 = d1 + DFS(nextE, p2)
    let result2 = d2 + DFS(p1, nextE)
    
    dp[p1][p2] = min(result1, result2)
    return dp[p1][p2]
}

func route(_ p1: Int, _ p2: Int) {
    if p1 == M || p2 == M { return  }

    let nextE = max(p1,p2) + 1
    var d1 = 0
    var d2 = 0
    if p1 == 0 { d1 = findDist(1, 1, arr[nextE][0], arr[nextE][1]) }
    else { d1 = findDist(arr[p1][0], arr[p1][1], arr[nextE][0], arr[nextE][1]) }
    
    if p2 == 0 { d2 = findDist(N, N, arr[nextE][0], arr[nextE][1])}
    else { d2 = findDist(arr[p2][0], arr[p2][1], arr[nextE][0], arr[nextE][1]) }
    
    if dp[nextE][p2] + d1 < dp[p1][nextE] + d2 {
        print(1)
        route(nextE, p2)
    } else {
        print(2)
        route(p1, nextE)
    }
    
}

func findDist(_ y: Int, _ x: Int, _ yy: Int, _ xx: Int) -> Int { return abs(y - yy) + abs(x - xx) }

print(DFS(0, 0))
route(0, 0)
