//
//  main.swift
//  no.1520_RE
//
//  Created by 노영재 on 2023/05/12.
//

import Foundation

let dx = [1, 0 , -1, 0]
let dy = [0, 1, 0, -1]

let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }

let N = NM[0]
let M = NM[1]

var arr = [[Int]](repeating: [], count: N)

for i in 0..<N {
    arr[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
}

var dp = [[Int]](repeating: [Int](repeating: -1, count: M), count: N)
var result = 0
func DFS(_ y: Int, _ x: Int) -> Int {
    if y == N - 1 && x == M - 1 {
        return 1
    }
    if dp[y][x] != -1 {
        return dp[y][x]
    }
    
    dp[y][x] = 0
    for i in 0..<4 {
        let nextY = y + dy[i]
        let nextX = x + dx[i]
        
        if nextY >= 0 &&
            nextX >= 0 &&
            nextY < N &&
            nextX < M {
            if arr[nextY][nextX] < arr[y][x] {
                dp[y][x] += DFS(nextY, nextX)
            }
        }
    }
    
    return dp[y][x]
}

print(DFS(0, 0))

