//
//  main.swift
//  no.1806
//
//  Created by 노영재 on 2023/04/28.
//

import Foundation

let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = NM[0]
let M = NM[1]

var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

var l = 0
var r = 0
var sum = 0
var result = Int.max

while true {
    if sum >= M {
        sum -= arr[l]
        l += 1
    } else if r == N { break }
    else {
        sum += arr[r]
        r += 1
    }
    
    if sum >= M {
        result = min(result, r - l)
    }
}

if result == Int.max { result = 0 }
print(result)
