//
//  main.swift
//  no.1074
//
//  Created by 노영재 on 2022/12/29.
//

import Foundation

let read = readLine()!.split(separator: " ").map { Int((String($0)))! }

let N = read[0]
let Y = read[1]
let X = read[2]

let max = Int(pow(2.0, Float(N)))
var count = 0
var result = 0
var end = false
func solve(_ y: Int, _ x:Int, n: Int) {
    if end {
        return
    }
    if y > Y ||
        (y + n) < Y ||
        x > X ||
        (x + n) < X {
        count += (n * n)
        return
    }
    
    if n == 2 {
        for i in 0..<2 {
            for j in 0..<2 {
                if Y == y + i && X == x + j {
                    result = count
                    end = true
                    return
                }
                count += 1
            }
        }
    } else {
        let nextN = n/2
        for i in 0..<2 {
            for j in 0..<2 {
                solve(y + i * nextN, x + j * nextN, n: nextN)
            }
        }
    }
}

(solve(0, 0, n: max))

print(result)
