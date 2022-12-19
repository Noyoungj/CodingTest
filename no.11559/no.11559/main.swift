//
//  main.swift
//  no.11559
//
//  Created by 노영재 on 2022/12/15.
//

import Foundation

let maxY = 12
let maxX = 6
var arr = [[String]](repeating: [String](repeating: "", count: maxX), count: maxY)

for i in 0..<maxY {
    arr[i] = readLine()!.map{ String($0) }
}

arr = arr.reversed() as [[String]]

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]
let colors = ["R", "G", "B", "P", "Y"]

var visited = [[Bool]](repeating: [Bool](repeating: false, count: maxX), count: maxY)

var count = 0
var colorIdx : [(Int, Int)] = []
var beingBoob = [[Bool]](repeating: [Bool](repeating: false, count: maxX), count: maxY)

func clear() -> Bool {
    var bool = false
    
    for j in 0..<maxY {
        for i in 0..<maxX {
            if beingBoob[j][i] {
                bool = true
                arr[j][i] = "."
                beingBoob[j][i] = false
            }
        }
    }
    
    return bool
}

func G() {
    for i in 0..<maxX {
        for y in 0..<maxY {
            if arr[y][i] == "." {
                var s = 0
                for j in y..<maxY {
                    if arr[j][i] != "." {
                        s = j
                        break
                    }
                }
                if s == 0 {
                    continue
                }
                
                for j in s..<maxY {
                    arr[j - s + y][i] = arr[j][i]
                    arr[j][i] = "."
                }
            }
        }
    }
}

func DFS(_ y: Int, _ x: Int, _ c: String) {
    for i in 0..<4 {
        let nextX = x + dx[i]
        let nextY = y + dy[i]
        
        if nextX >= 0 &&
            nextX < maxX &&
            nextY >= 0 &&
            nextY < maxY {
            if !visited[nextY][nextX] && arr[nextY][nextX] == c {
                visited[nextY][nextX] = true
                count += 1
                colorIdx.append((nextY, nextX))
                DFS(nextY, nextX, c)
            }
        }
    }
}

var result = 0

for color in colors {
    for j in 0..<maxY {
        for i in 0..<maxX {
            if arr[j][i] == color {
                DFS(j, i, color)
                if colorIdx.count >= 4 {
                    for (y, x) in colorIdx {
                        beingBoob[y][x] = true
                    }
                }
                colorIdx = []
            }
        }
    }
}

while clear() {
    visited = [[Bool]](repeating: [Bool](repeating: false, count: maxX), count: maxY)
    result += 1
    G()

    for color in colors {
        for j in 0..<maxY {
            for i in 0..<maxX {
                if arr[j][i] == color {
                    DFS(j, i, color)
                    if colorIdx.count >= 4 {
                        for (y, x) in colorIdx {
                            beingBoob[y][x] = true
                        }
                    }
                    colorIdx = []
                }
            }
        }
    }
}

func nowARR() {
    print("")
    for i in 0..<maxY {
        print(arr[i].joined())
    }
}

print(result)
