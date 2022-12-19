//
//  main.swift
//  no.2644
//
//  Created by 노영재 on 2022/12/14.
//

import Foundation

let N = Int(readLine()!)!
let question = readLine()!.split(separator: " ").map{ Int(String($0))! }

let num1 = question[0]
let num2 = question[1]

let M = Int(readLine()!)!
var array : [[Int]] = []

for _ in 0..<M {
    array.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
}

var arr = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)

for i in 0..<M {
    let x = array[i][0]
    let y = array[i][1]
    
    arr[x - 1][y - 1] = 1
    arr[y - 1][x - 1] = 1
}
var visisted = [Bool](repeating: false, count: N)
var result = -1
func BFS() {
    var q : [(Int, Int)] = [(num1 - 1, 0)]
    
    while !q.isEmpty {
        let (now, d) = q.removeFirst()
        if now == (num2 - 1) {
            result = d
            break
        }
        for i in 0..<N {
            if arr[now][i] == 1 && !visisted[i] {
                visisted[i] = true
                q.append((i, d + 1))
            }
        }
    }
}

BFS()

print(result)
