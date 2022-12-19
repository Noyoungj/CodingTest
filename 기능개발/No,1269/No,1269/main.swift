//
//  main.swift
//  No,1269
//
//  Created by 노영재 on 2022/12/06.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = input[0]
let m = input[1]
let v = input[2]

var array = Array(repeating: Array(repeating: 0, count: n), count: n)
var visited = [Bool](repeating: false, count: n)

for i in 0..<m {
    let nums = readLine()!.split(separator: " ").map{ Int(String($0))! }
    array[nums[0] - 1][nums[1] - 1] = 1
    array[nums[1] - 1][nums[0] - 1] = 1
}

func DFS(_ idx: Int) {
    visited[idx] = true
    print(idx + 1, terminator: " ")
    
    for i in 0..<n {
        if !visited[i] && array[idx][i] == 1 {
            DFS(i)
        }
    }
}

func BFS(_ idx: Int) {
    var queue : [Int] = []
    visited[idx] = false
    queue.append(idx)
    
    while !queue.isEmpty {
        let new = queue.removeFirst()
        print(new + 1, terminator: " ")
        
        for i in 0..<n {
            if visited[i] && array[new][i] == 1 {
                queue.append(i)
                visited[i] = false
            }
        }
    }
}

DFS(v - 1)
print("")
BFS(v - 1)

