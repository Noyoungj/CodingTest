//
//  main.swift
//  no.2583
//
//  Created by 노영재 on 2022/12/11.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }

let maxY = input[0]
let maxX = input[1]
let numRect = input[2]
var graph = [[Int]](repeating: [Int](repeating: 0, count: maxX), count: maxY)
var arr : [[Int]] = []
for _ in 0..<numRect {
    arr.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
}


for i in arr {
    let minx = min(i[0], i[2])
    let maxx = max(i[0], i[2])
    let miny = min(i[1], i[3])
    let maxy = max(i[1], i[3])
    
    for y in miny..<maxy {
        for x in minx..<maxx {
            graph[y][x] = 1
        }
    }
}

var visited = [[Bool]](repeating: [Bool](repeating: false, count: maxX), count: maxY)
var sum = 0
var size = 1
var result : [Int] = []
let direct = [[1, 0], [0,1], [-1, 0], [0, -1]]

func DFS(_ x: Int, _ y: Int) {
    var queue : [[Int]] = [[y,x]]
    
    while !queue.isEmpty {
        let now = queue.removeLast()
        let nowX = now[1]
        let nowY = now[0]
        
        for i in direct {
            let nextY = nowY + i[0]
            let nextX = nowX + i[1]
            
            if nextY >= 0 &&
                nextY < maxY &&
                nextX >= 0 &&
                nextX < maxX {
                if !visited[nextY][nextX] && graph[nextY][nextX] == 0 {
                    size += 1
                    visited[nextY][nextX] = true
                    queue.append([nextY,nextX])
                }
            }
        }
    }
    
    result.append(size)
    size = 1
}

for y in 0..<maxY {
    for x in 0..<maxX {
        if !visited[y][x] && graph[y][x] == 0 {
            sum += 1
            visited[y][x] = true

            DFS(x, y)
        }
    }
}

let resultArr = result.sorted(by: <)

print(sum)

for i in resultArr {
    print(i, terminator: " ")
}
