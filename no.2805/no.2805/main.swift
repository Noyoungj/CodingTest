//
//  main.swift
//  no.2805
//
//  Created by 노영재 on 2023/03/24.
//

import Foundation

let MAX = 1000000000

let NM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = NM[0]
let M = NM[1]

var array = readLine()!.split(separator: " ").map{ Int($0)! }

var high = MAX
var low = 0
while(low + 1 < high) {
    let mid = (low + high)/2
    var sum = 0
    for i in array {
        if i > mid { sum += (i - mid) }
    }
    
    if sum >= M {
        low = mid
    } else {
        high = mid
    }
}

print(low)
