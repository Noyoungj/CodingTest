//
//  main.swift
//  no.10971
//
//  Created by 노영재 on 2022/12/08.
//

import Foundation

let N = Int(readLine()!)!

var visited = [Bool](repeating: false, count: N)
var array = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)

for i in 0..<N {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    array[i] = input
}

var result : [Int] = []
var re = Int.max

var sum = 0

func DFS(_ depth : Int, _ now : Int , _ start : Int) {
    if depth == N && now == start {
        re = min(re, sum)
        return
    }
    
    for i in 0..<N {
        if !visited[i] && array[now][i] != 0 {
            
            visited[i] = true
            sum += array[now][i]
            
            if sum <= re {
                DFS(depth + 1 , i, start)
            }
            
            visited[i] = false
            sum -= array[now][i]
        }
    }
}

DFS(0, 0, 0)

print(re)
