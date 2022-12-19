//
//  main.swift
//  no.10451
//
//  Created by 노영재 on 2022/12/06.
//

import Foundation

let input = readLine()!

func DFS(_ idx: Int, visited: inout [Bool], array: [Int]) {
    visited[idx] = true
    if !visited[array[idx] - 1] {
        DFS(array[idx] - 1, visited: &visited, array: array)
    }
}

for _ in 0..<Int(input)! {
    let num = Int(readLine()!)!
    let array = readLine()!.split(separator: " ").map{ Int(String($0))! }
    var visited = [Bool](repeating: false, count: num)
    var result = 0
    
    for i in 0..<num {
        if !visited[i] {
            result += 1
            DFS(i, visited: &visited, array: array)
        }
    }
    print(result)
}


