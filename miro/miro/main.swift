//
//  main.swift
//  miro
//
//  Created by 노영재 on 2023/03/30.
//

import Foundation

let dx = [1, 0 , -1 , 0]
let dy = [0, 1, 0, -1]

func solution(_ maps:[String]) -> Int {
    let MAXX = maps[0].count
    let MAXY = maps.count
    var board = [[String]](repeating: [], count: MAXY)
    
    
    for i in 0..<MAXY {
        board[i] = maps[i].map{ String($0) }
    }
    
    var (sx, sy, ex, ey, lx, ly) = (0,0,0,0,0,0)
    
    for i in 0..<MAXY {
        for j in 0..<MAXX {
            if board[i][j] == "S" {
                (sx, sy) = (j, i)
            } else if board[i][j] == "L" {
                (lx, ly) = (j, i)
            } else if board[i][j] == "E" {
                (ex, ey) = (j, i)
            }
        }
    }

    var lcount = -1
    var ecount = -1
    var q : [(Int, Int, Int)] = [(sx, sy, 0)]
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: MAXX), count: MAXY)
    while !q.isEmpty {
        let (x, y , d) = q.removeFirst()
        
        if x == lx && y == ly {
            lcount = d
            break
        }
        
        for i in 0..<4 {
            let nextX = dx[i] + x
            let nextY = dy[i] + y
            
            if nextX >= 0 &&
            nextX < MAXX &&
            nextY >= 0 &&
            nextY < MAXY {
                if board[nextY][nextX] != "X" && !visited[nextY][nextX] {
                    visited[nextY][nextX] = true
                    q.append((nextX, nextY, d + 1))
                }
            }
        }
    }
    
    if lcount == -1 {
        return lcount
    }
    
    q = [(lx, ly, 0)]
    visited = [[Bool]](repeating: [Bool](repeating: false, count: MAXX), count: MAXY)
    
    while !q.isEmpty {
        let (x, y , d) = q.removeFirst()
        
        if x == ex && y == ey {
            ecount = d
            break
        }
        
        for i in 0..<4 {
            let nextX = dx[i] + x
            let nextY = dy[i] + y
            
            if nextX >= 0 &&
            nextX < MAXX &&
            nextY >= 0 &&
            nextY < MAXY {
                if board[nextY][nextX] != "X" && !visited[nextY][nextX] {
                    visited[nextY][nextX] = true
                    q.append((nextX, nextY, d + 1))
                }
            }
        }
    }
    
    if ecount == -1 {
        return -1
    }
    
    return lcount + ecount
}
