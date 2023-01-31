//
//  main.swift
//  no.1520
//
//  Created by 노영재 on 2023/01/31.
//

import Foundation

let read = readLine()!.split(separator: " ").map{ Int($0)! }
let MAXY = read[0]
let MAXX = read[1]

var arr = [[Int]](repeating: [Int](repeating: 0, count: MAXX), count: MAXY)
for i in 0..<MAXY {
    arr[i] = readLine()!.split(separator: " ").map{ Int($0)! }
}

let dx = [1, 0 , -1, 0]
let dy = [0, 1, 0, -1]

var dp = [[Int]](repeating: [Int](repeating: -1, count: MAXX), count: MAXY)

func solve( y: Int, x : Int) -> Int {
    if y == MAXY - 1 && x == MAXX - 1 {
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
            nextY < MAXY &&
            nextX < MAXX {
            if arr[nextY][nextX] < arr[y][x] {
                dp[y][x] = dp[y][x] +  solve(y: nextY, x: nextX)
            }
        }
    }
    
    return dp[y][x]
}

print(solve(y: 0, x: 0))
