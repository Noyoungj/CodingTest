//
//  main.swift
//  no.11047
//
//  Created by 노영재 on 2022/12/20.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
var money = input[1]
var arr : [Int] = []
for _ in 0..<input[0] {
    arr.append(Int(readLine()!)!)
}

arr.sort(by: >)

var result = 0
for i in arr {
    if money/i == 0 {
        continue
    } else {
        result += money/i
        money = money%i
    }
}

print(result)
