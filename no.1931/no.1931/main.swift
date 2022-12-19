//
//  main.swift
//  no.1931
//
//  Created by 노영재 on 2022/12/20.
//

import Foundation

let N = Int(readLine()!)!

var arr : [(Int, Int, Int)] = []
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    
    arr.append((input[0], input[1], input[1] - input[0]))
}

arr.sort { first, second in
    if first.1 == second.1 {
        return first.0 < second.0
    } else {
        return first.1 < second.1
    }
}

var result = 0
var now = 0

for i in arr {
    if now <= i.0 {
        result += 1
        now = i.1
    }
}

print(result)
