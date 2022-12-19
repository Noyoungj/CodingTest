//
//  main.swift
//  no.3055
//
//  Created by 노영재 on 2022/12/15.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let maxY = input[0]
let maxX = input[1]

var arr = [[String]](repeating: [String](repeating: "", count: maxX), count: maxY)
for i in 0..<maxY {
    arr[i] = readLine()!.map{ String($0) }
}

var StartY = 0
var StartX = 0
var water : [(Int, Int)] = []
var endY = 0
var endX = 0
let dx = [1, 0 , -1, 0]
let dy = [0, 1, 0, -1]

for i in 0..<maxY {
    for j in 0..<maxX {
        if arr[i][j] == "S" {
            StartX = j
            StartY = i
        } else if arr[i][j] == "D" {
            endX = j
            endY = i
        } else if arr[i][j] == "*" {
            water.append((i, j))
        }
    }
}

func flow() {
    var temp : [(Int, Int)] = []
    
    while !water.isEmpty {
        let (y, x) = water.removeFirst()
        
        for i in 0..<4 {
            let nextX = x + dx[i]
            let nextY = y + dy[i]
            
            if nextX >= 0 &&
                nextX < maxX &&
                nextY >= 0 &&
                nextY < maxY {
                if arr[nextY][nextX] == "." {
                    temp.append((nextY,nextX))
                    arr[nextY][nextX] = "*"
                }
            }
        }
    }
    
    water = temp
}

var visited = [[Bool]](repeating: [Bool](repeating: false, count: maxX), count: maxY)

func BFS() -> Int {
    var q : [(Int, Int, Int)] = [ (StartY, StartX, 0) ]
    var nowTime = -1
    
    while !q.isEmpty {
        let (y, x, time) = q.removeFirst()
        
        if y == endY && x == endX {
            return time
        }
        
        if nowTime != time {
            flow()
            nowTime = time
        }
        
        for i in 0..<4 {
            let nextY = y + dy[i]
            let nextX = x + dx[i]
            
            if nextY >= 0 &&
                nextY < maxY &&
                nextX >= 0 &&
                nextX < maxX {
                if !visited[nextY][nextX] && (arr[nextY][nextX] == "." || arr[nextY][nextX] == "D") {
                    visited[nextY][nextX] = true
                    q.append((nextY, nextX, time + 1))
                }
            }
        }
    }
    
    return -1
}

let result = BFS()
print(result)
print(result == -1 ? "KAKTUS" : result)
