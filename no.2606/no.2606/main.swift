//
//  main.swift
//  no.2606
//
//  Created by 노영재 on 2022/12/09.
//

import Foundation

let com = Int(readLine()!)!
let line = Int(readLine()!)!

var visited = [Bool](repeating: false, count: com)
var arr = [[Int]](repeating: [Int](repeating: 0, count: com), count: com)

for i in 0..<line {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))!}
    
    arr[input[0] - 1][input[1] - 1] = 1
    arr[input[1] - 1][input[0] - 1] = 1
}

func DFS(_ idx: Int, result: inout Int) {
    result += 1
    visited[idx] = true
    
    for i in 0..<com {
        if !visited[i] && arr[idx][i] == 1{
            DFS(i, result: &result)
        }
    }
}

var network : [Int] = []
var result  = 0
for i in 0..<com {
    if !visited[i] {
        DFS(i, result: &result)
        network.append(result)
        result = 0
    }
}

print(network[0] - 1)
