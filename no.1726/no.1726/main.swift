//
//  main.swift
//  no.1726
//
//  Created by 노영재 on 2022/12/15.
//

import Foundation

let YX = readLine()!.split(separator: " ").map{ Int(String($0))! }
let maxY = YX[0]
let maxX = YX[1]

var array = [[Int]](repeating: [Int](repeating: 0, count: maxX), count: maxY)

for i in 0..<maxY {
    array[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
}


let start = readLine()!.split(separator: " ").map{ Int(String($0))! }
let end = readLine()!.split(separator: " ").map{ Int(String($0))! }

var (sy, sx, sd) = (start[0] - 1, start[1] - 1, start[2] - 1)
var (ey, ex, ed) = (end[0] - 1, end[1] - 1, end[2] - 1)

let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]
let dd = [-2, 2]
var visisted = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: Int.max, count: 4), count: maxX), count: maxY)
var result = Int.max
var nowDirect : [Int] = []

func BFS() {
    var q : [(Int, Int, Int, Int)] = [(sy, sx, sd, 0)]
    
    while !q.isEmpty {
        var (y, x, d, c) = q.removeFirst()
        
        if y == ey && x == ex && d == ed {
            result = min(result, c)
            continue
        }
        var nextY = y
        var nextX = x
        
        switch d%2 {
        case 0:
            var nextD1 = d - 1
            var nextD2 = d + 2
            
            if nextD1 < 0 {
                nextD1 = 3
            }
            
            if nextD2 > 3 {
                nextD2 = d - 2
            }
            if visisted[y][x][nextD1] > c + 1 {
                visisted[y][x][nextD1] = c + 1
                q.append((y, x, nextD1, c + 1))
            }
            
            if visisted[y][x][nextD2] > c + 1 {
                visisted[y][x][nextD2] = c + 1
                q.append((y, x, nextD2, c + 1))
            }
            
        case 1:
            var nextD1 = d + 1
            var nextD2 = d + 2
            
            if nextD1 > 3 {
                nextD1 = 0
            }
            
            if nextD2 > 3 {
                nextD2 = d - 2
            }
      
            if visisted[y][x][nextD1] > c + 1 {
                visisted[y][x][nextD1] = c + 1
                q.append((y, x, nextD1, c + 1))
            }
            
            if visisted[y][x][nextD2] > c + 1 {
                visisted[y][x][nextD2] = c + 1
                q.append((y, x, nextD2, c + 1))
            }
        default:
            return
        }
        
        for _ in 1...3 {
            nextY += dy[d]
            nextX += dx[d]
            
            if nextY >= 0 &&
                nextX >= 0 &&
                nextX < maxX &&
                nextY < maxY {
                if visisted[nextY][nextX][d] > c + 1 && array[nextY][nextX] == 0 {
                    visisted[nextY][nextX][d] = c + 1
                    q.append((nextY, nextX, d, c + 1))
                }
                if array[nextY][nextX] == 1 {
                    break
                }
            }
        }
        
        
        
    }
}

BFS()

print(result)
