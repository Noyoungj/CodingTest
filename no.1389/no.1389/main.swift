//
//  main.swift
//  no.1389
//
//  Created by 노영재 on 2022/12/14.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = input[0]
let M = input[1]

var array : Set<[Int]> = []

for _ in 0..<M {
    array.insert(readLine()!.split(separator: " ").map{ Int(String($0))! })
}

var arr = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)

for _ in 0..<array.count {
    let xy = array.removeFirst()
    arr[xy[0] - 1][xy[1] - 1] = 1
    arr[xy[1] - 1][xy[0] - 1] = 1
}

var visited = [Bool](repeating: false, count: N)
var visitedNum = [Int](repeating: 0, count: N)

func BFS(_ idx: Int) {
    var q : [(Int, Int)] = [(idx, 1)]
    
    while !q.isEmpty {
        let (now, count) = q.removeFirst()
        
        for i in 0..<N {
            if arr[now][i] == 1 && !visited[i] {
                visited[i] = true
                visitedNum[i] = count
                q.append((i, count + 1))
            }
        }
    }
}

var sum = [Int](repeating: 0, count: N)
for i in 0..<N {
    visited[i] = true
    BFS(i)
    sum[i] = visitedNum.reduce(0) { $0 + $1 }
    visitedNum = [Int](repeating: 0, count: N)
    visited = [Bool](repeating: false, count: N)
}


print(sum.firstIndex(of: sum.min()!)! + 1)
