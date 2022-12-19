//
//  main.swift
//  no.2468
//
//  Created by 노영재 on 2022/12/06.
//

import Foundation

let direct : [[Int]] = [[1,0], [0,1], [-1,0], [0, -1]]
func DFS(_ y : Int, _ x : Int, _ h: Int) {
    visisted[y][x] = true
    
    for i in direct {
        let nextY = y + i[0]
        let nextX = x + i[1]
        
        if nextX >= 0 &&
            nextX < n &&
            nextY >= 0 &&
            nextY < n {
            if !visisted[nextY][nextX] && array[nextY][nextX] > h {
                DFS(nextY, nextX, h)
            }
        }
        
    }
}

let n = Int(readLine()!)!

var array = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var result : [Int] = []
var visisted = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

for i in 0..<n {
    array[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
}

let max  = array.flatMap{ $0 }.max()!

for i in 0..<max {
    visisted = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var num = 0
    
    for y in 0..<n {
        for x in 0..<n {
            if !visisted[y][x] && array[y][x] > i {
                num += 1
                DFS(y, x, i)
            }
        }
    }
    
    result.append(num)
}

print(result.max()!)
