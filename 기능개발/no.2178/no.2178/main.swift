//
//  main.swift
//  no.2178
//
//  Created by 노영재 on 2022/12/06.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = input[0]
let m = input[1]

var array = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)

for i in 0..<n {
    let arr : [Int] = String(readLine()!).map{ Int(String($0))! }
    
    array[i] = arr
}

var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var distance = [[Int]](repeating: [Int](repeating: 1, count: m), count: n)
let direct = [[1, 0], [0, 1], [-1, 0], [0, -1]]
var queue : [[Int]] = [[0, 0]]
var result : Int = 1

func BFS() {
    
    while !queue.isEmpty {
        let point = queue.removeFirst()
        let y = point[0]
        let x = point[1]
        
        for i in direct {
            let nextY = y + i[1]
            let nextX = x + i[0]
            if  nextX >= 0 &&
                nextY >= 0 &&
                nextX < m &&
                nextY < n {
                if array[nextY][nextX] == 1 && !visited[nextY][nextX] {
                    queue.append([nextY, nextX])
                    distance[nextY][nextX] = distance[y][x] + 1
                    visited[nextY][nextX] = true
                }
            }
        }
    }
}

visited[0][0] = true
BFS()
print(distance[n - 1][m - 1])
