//
//  main.swift
//  no.2146
//
//  Created by 노영재 on 2022/12/14.
//

import Foundation

let N = Int(readLine()!)!


var map = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)

for i in 0..<N {
    map[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
}

var result = Int.max
let dx = [1, 0 , -1, 0]
let dy = [0, 1, 0, -1]
var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
var dic : [Int : [(Int, Int)]] = [:]


func DFS(_ y: Int, _ x: Int, _ c: Int) {
    for i in 0..<4 {
        let nextY = y + dy[i]
        let nextX = x + dx[i]
        
        if nextY >= 0 &&
            nextX >= 0 &&
            nextY < N &&
            nextX < N {
            if !visited[nextY][nextX] && map[nextY][nextX] == 1 {
                dic[c]?.append((nextY, nextX))
                map[nextY][nextX] = c
                visited[nextY][nextX] = true
                DFS(nextY, nextX, c)
            }
        }
    }
}

var num = 2
for i in 0..<N {
    for j in 0..<N {
        if !visited[i][j] && map[i][j] == 1 {
            map[i][j] = num
            visited[i][j] = true
            dic[num] = [(i, j)]
            DFS(i, j, num)
            num += 1
        }
    }
}

func BFS(_ idx: Int) -> Int {
    var q = dic[idx]!
    var dist = [[Int]](repeating: [Int](repeating: Int.max, count: N), count: N)
    q.forEach{ dist[$0][$1] = 0 }
    
    while !q.isEmpty {
        let (y, x) = q.removeFirst()
        
        if map[y][x] != 0 && map[y][x] != idx {
            return dist[y][x]
        }
        
        for i in 0..<4 {
            let nextY = y + dy[i]
            let nextX = x + dx[i]
            
            if nextX >= 0 &&
                nextY >= 0 &&
                nextX < N &&
                nextY < N {
                if dist[nextY][nextX] > dist[y][x] + 1 {
                    dist[nextY][nextX] = dist[y][x] + 1
                    q.append((nextY, nextX))
                }
            }
        }
    }
    
    
    return 0
}

for i in 2..<num {
    let dis = BFS(i)
    result = min(dis, result)
}

print(result - 1)
