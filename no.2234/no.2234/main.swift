//
//  main.swift
//  no.2234
//
//  Created by 노영재 on 2022/12/16.
//

import Foundation

let XY = readLine()!.split(separator: " ").map{ Int(String($0))! }
let X = XY[0]
let Y = XY[1]

var arr = [[Int]](repeating: [Int](repeating: 0, count: X), count: Y)

for i in 0..<Y {
    arr[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
}

// [남, 동, 북, 서]
var splitArr : [Int] = [8, 4, 2, 1]
func split(_ idx: Int) -> [Int] {
    var wallArr = [Int](repeating: 0, count: 4)
    var num = idx
    
    for i in 0...3 {
        if num/splitArr[i] == 1 {
            wallArr[i] = 1
            num = num%splitArr[i]
        }
    }
    
    return wallArr
}

print(split(11))
