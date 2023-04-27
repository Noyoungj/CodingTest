//
//  main.swift
//  no.2003
//
//  Created by 노영재 on 2023/04/26.
//

import Foundation

var NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
var N = NM[0]
var M = NM[1]

var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

var l = 0
var r = 0
var sum = 0
var result = 0

while true {
    if sum >= M {
        sum -= arr[l]
        l += 1
    } else if r == N { break }
    else {
        sum += arr[r]
        r += 1
    }
    
    if sum == M { result += 1 }
}

print(result)
