//
//  main.swift
//  no.2512
//
//  Created by 노영재 on 2023/03/24.
//

import Foundation

let N = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }
let K = Int(readLine()!)!

var low = 0
var high = array.max()!

while ( low <= high) {
    let mid = (low + high)/2
    
    var sum = 0
    
    for i in array {
        sum += min(i, mid)
    }
    if sum > K { high = mid - 1 }
    else { low = mid + 1 }
//    if sum > K { high = mid - 1 }
//    else { low = mid + 1 }
}

print(low - 1)
