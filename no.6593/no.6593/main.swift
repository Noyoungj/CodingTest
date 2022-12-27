//
//  main.swift
//  no.6593
//
//  Created by 노영재 on 2022/12/27.
//

import Foundation

struct direct : Hashable {
    var z : Int
    var y : Int
    var x : Int
}

var sx = 0
var sy = 0
var sz = 0
var ex = 0
var ey = 0
var ez = 0

let dx = [1, 0, -1, 0, 0, 0]
let dy = [0, 1, 0 , -1, 0, 0]
let dz = [0, 0, 0, 0, 1, -1]

var re : [Int] = []

while true {
    let LRC = readLine()!.split(separator: " ").map{ Int($0)! }
    let L = LRC[0]
    let R = LRC[1]
    let C = LRC[2]
    var result = -1

    if L == 0 && R == 0 && C == 0 {
        break
    }
    
    var arr = [[[String]]](repeating: [[String]](repeating: [String](repeating: "", count: C), count: R), count: L)
    
    for i in 0..<L {
        for j in 0...R {
            var read = readLine()!.map{ String($0) }
            if read.isEmpty {
                continue
            }
            
            for k in 0..<read.count {
                if (read[k]) == "S" {
                    sx = k
                    sy = j
                    sz = i
                } else if (read[k]) == "E" {
                    ex = k
                    ey = j
                    ez = i
                }
            }
            
            arr[i][j] = read
        }
    }
    
    func bfs() {
        var queue : [(Int, Int, Int, Int)] = []
        var isVisited : Set<direct> = []
        queue.append((sz , sy, sx, 0))
        isVisited.insert(direct.init(z: 0, y: 0, x: 0))
        
        while !queue.isEmpty {
            let (z, y, x, d) = queue.removeFirst()
            if z == ez && y == ey && x == ex {
                result = d
                break
            }
            for i in 0..<6 {
                let nextZ = z + dz[i]
                let nextY = y + dy[i]
                let nextX = x + dx[i]
                
                if nextZ >= 0 &&
                    nextZ < L &&
                    nextY >= 0 &&
                    nextY < R &&
                    nextX >= 0 &&
                    nextX < C {
                    if arr[nextZ][nextY][nextX] != "#" && !isVisited.contains(direct.init(z: nextZ, y: nextY, x: nextX)) {
                        queue.append((nextZ, nextY, nextX, d + 1))
                        isVisited.insert(direct.init(z: nextZ, y: nextY, x: nextX))
                    }
                }
            }
        }
    }
    
    bfs()
    re.append(result)
}

for i in re {
    if i == -1 {
        print("Trapped!")
    } else {
        print("Escaped in \(i) minute(s).")
    }
}
