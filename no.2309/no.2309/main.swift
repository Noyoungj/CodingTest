//
//  main.swift
//  no.2309
//
//  Created by 노영재 on 2023/01/17.
//

import Foundation

var arr : [Int] = []

for _ in 1...9 {
    arr.append(Int(readLine()!)!)
}
let sum = arr.reduce(0) { $1 + $0 }
let MAX = 100
var bool = false
for i in 0..<8 {
    for j in i + 1..<9 {
        
        if MAX == (sum - arr[i] - arr[j]) {
            arr[i] = -1
            arr[j] = -1
            bool = true
            break
        }
    }
    if bool {
        break
    }
}

var result = arr.filter{ $0 != -1 }
result.sort()
for i in 0..<7 {
    print(result[i])
}
