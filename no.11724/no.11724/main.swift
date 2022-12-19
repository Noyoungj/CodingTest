//
//  main.swift
//  no.11724
//
//  Created by 노영재 on 2022/12/08.
//

import Foundation

func DFS(_ idx : Int) {
    visited[idx] = true
    
    for i in 0..<n {
        if !visited[i] && array[idx][i] == 1 {
            DFS(i)
        }
    }
}

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }

let n = input[0]
let m = input[1]

var array = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

for _ in 0..<m {
    let v = readLine()!.split(separator: " ").map{ Int(String($0))! - 1 }
    array[v[0]][v[1]] = 1
    array[v[1]][v[0]] = 1
}

var visited = [Bool](repeating: false, count: n)
var result = 0

for i in 0..<n {
    if !visited[i] {
        result += 1
        DFS(i)
    }
}

print(result)

