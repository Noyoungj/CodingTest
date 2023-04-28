//
//  main.swift
//  no.2230
//
//  Created by 노영재 on 2023/04/28.
//

import Foundation

let NM = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = NM[0]
let M = NM[1]

var arr = [Int](repeating: 0, count: N)

for i in 0..<N {
    arr[i] = Int(readLine()!)!
}

arr.sort(by: <)

var l = 0
var r = 0
var sum = 0
var result = Int.max
while true {
    if M == 0 {
        result = 0
        break
    }
    if r == N {
        sum = arr[r - 1] - arr[l]
    } else {
        sum = arr[r] - arr[l]
    }
    
    if sum >= M {
        l += 1
    } else if r == N { break }
    else {
        r += 1
    }
    if sum >= M {
        result = min(result, sum)
    }
}

print(result)
