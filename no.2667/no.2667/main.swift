//
//  main.swift
//  no.2667
//
//  Created by 노영재 on 2022/12/06.
//

import Foundation

let direct : [[Int]] = [[1, 0], [0, 1], [-1, 0], [0, -1]]
func DFS(_ y: Int, _ x: Int) {
    visisted[y][x] = true
    size += 1
    for i in direct {
        let nextY = y + i[0]
        let nextX = x + i[1]
        
        if nextY >= 0 &&
            nextY < n &&
            nextX >= 0 &&
            nextX < n {
            if !visisted[nextY][nextX] && array[nextY][nextX] == 1 {
                DFS(nextY, nextX)
            }
        }
    }
    
}

let n : Int = Int(readLine()!)!
var array = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var size = 1
var result : [Int] = []

for i in 0..<n {
    array[i] = readLine()!.map{ Int(String($0))! }
}

var visisted = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

for i in 0..<n {
    for j in 0..<n {
        if !visisted[i][j] && array[i][j] == 1 {
            size = 0
            DFS(i, j)
            
            result.append(size)
        }
    }
}

print(result.count)
for i in result.sorted(by: <) {
    print(i)
}
