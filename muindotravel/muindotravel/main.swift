//
//  main.swift
//  muindotravel
//
//  Created by 노영재 on 2023/04/06.
//

import Foundation

var MAXX = 0
var MAXY = 0
var dy = [0, 1, 0, -1]
var dx = [1, 0, -1, 0]
var boards = [[String]](repeating: [], count: MAXY)
var visited : [[Bool]] = []

func solution(_ maps:[String]) -> [Int] {
    var answer : [Int] = []
    
    MAXY = maps.count
    MAXX = maps[0].count
    
    visited = [[Bool]](repeating: [Bool](repeating: false, count: MAXX), count: MAXY)
    
    for i in 0..<MAXY {
        boards[i] = maps[i].map{ String($0) }
    }
    
    for i in 0..<MAXY {
        for j in 0..<MAXX {
            if !visited[i][j] && boards[i][j] != "X" {
                visited[i][j] = true
                answer.append(BFS(i, j))
            }
        }
    }
    
    if answer.isEmpty {
        answer.append(-1)
    } else {
        answer.sort(by: <)
    }
    return answer
}

func BFS(_ y: Int, _ x: Int) -> Int {
    var q = [(y, x)]
    var count = Int(boards[y][x])!
    while !q.isEmpty {
        let (ny, nx) = q.removeFirst()
        
        for i in 0..<4 {
            let nextY = ny + dy[i]
            let nextX = nx + dx[i]
            
            if nextY >= 0 &&
            nextX >= 0 &&
            nextY < MAXY &&
            nextX < MAXX {
                if !visited[nextY][nextX] && boards[nextY][nextX] != "X" {
                    visited[nextY][nextX] = true
                    count += Int(boards[nextY][nextX])!
                    q.append((nextY, nextX))
                }
            }
        }
    }
    
    return count
}
