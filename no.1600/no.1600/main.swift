//
//  main.swift
//  no.1600
//
//  Created by 노영재 on 2022/12/10.
//

import Foundation

var K = Int(readLine()!)!

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }

let W = input[0]
let H = input[1]

var arr = [[Int]](repeating: [Int](repeating: 0, count: W), count: H)

for i in 0..<H {
    arr[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
}

var depth = 0
var result = -1
var visited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 201), count: H), count: W)
var needVisit : [[Int]] = [[0, 0, 0, K]]
let horse : [[Int]] = [[2, 1], [1, 2], [-2, 1], [-1, 2], [-2, -1], [-1, -2], [2, -1], [1, -2]]
let direct : [[Int]] = [[1, 0], [ 0, 1], [-1, 0], [0, -1]]

func BFS() {
    while !needVisit.isEmpty {
        let now = needVisit.removeFirst()
        let nowY = now[0]
        let nowX = now[1]
        let depth = now[2]
        let k = now[3]
        
        
        if nowY == H - 1 && nowX == W - 1 {
            result = depth
            break
        }
        
        if K != 0 {
            
            for i in horse {
                let nextX = nowX + i[1]
                let nextY = nowY + i[0]
                
                if nextX >= 0 &&
                    nextX < W &&
                    nextY >= 0 &&
                    nextY < H {
                    if !visited[nextY][nextX][k - 1] && arr[nextY][nextX] == 0 {
                        visited[nextY][nextX][k - 1] = true
                        needVisit.append([nextY, nextX, depth + 1, k - 1])
                    }
                }
            }
        }
        
        for i in direct {
            let nextX = nowX + i[1]
            let nextY = nowY + i[0]
            
            if nextX >= 0 &&
                nextX < W &&
                nextY >= 0 &&
                nextY < H {
                if !visited[nextY][nextX][k] && arr[nextY][nextX] == 0 {
                    visited[nextY][nextX][k] = true
                    needVisit.append([nextY, nextX, depth + 1, k])
                }
            }
        }
    }
}

BFS()

print(result)


