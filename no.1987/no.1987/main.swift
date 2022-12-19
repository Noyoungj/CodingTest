//
//  main.swift
//  no.1987
//
//  Created by 노영재 on 2022/12/14.
//

import Foundation


let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let maxY = input[0]
let maxX = input[1]
let dx = [1, 0 , -1, 0]
let dy = [0, 1, 0, -1]
var arr = [[String]](repeating: [String](repeating: "", count: maxX), count: maxY)
for i in 0..<maxY {
    arr[i] = readLine()!.map{ String($0) }
}

var count = 0

var visited : Set = [ arr[0][0] ]
func DFS(_ x: Int, _ y: Int) {
    count = max(visited.count, count)
    
    for i in 0..<4 {
        let nextX = dx[i] + x
        let nextY = dy[i] + y
        
        if nextX >= 0 &&
            nextY >= 0 &&
            nextX < maxX &&
            nextY < maxY {
            let nextStr = arr[nextY][nextX]
            if !visited.contains(nextStr) {
                visited.insert(nextStr)
                DFS(nextX, nextY)
                visited.remove(nextStr)
            }
        }
    }
}

DFS(0, 0)

print(count)
