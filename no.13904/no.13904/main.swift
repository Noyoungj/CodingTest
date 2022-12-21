//
//  main.swift
//  no.13904
//
//  Created by 노영재 on 2022/12/22.
//

import Foundation

let N = Int(readLine()!)!

var array = [(Int, Int)](repeating: (0, 0), count: N)
var Max = 0
for i in 0..<N {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    array[i] = ( input[0], input[1] )
    Max = max(input[0], Max)
}

array.sort { first, second in
    if first.0 == second.0 {
        return first.1 > second.1
    } else {
        return first.0 < second.0
    }
}

var day = 1
var result : [Int] = []
var bool = false
while !array.isEmpty {
    let (d, s) = array.removeFirst()
    if d > day {
        day = d
    }
    if (result.count) < day {
        result.append(s)
        continue
    }
    
    if result.filter{ ($0 < s) }.isEmpty {
        continue
    } else {
        let M = result.min()!
        result[result.firstIndex(of: M)!] = s
    }
}

print(result.reduce(0) { $1 + $0})
