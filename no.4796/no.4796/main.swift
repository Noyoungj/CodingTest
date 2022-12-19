//
//  main.swift
//  no.4796
//
//  Created by 노영재 on 2022/12/20.
//

import Foundation

var array : [[Int]] = []
var now : [Int] = []
while now != [0, 0, 0] {
    now = readLine()!.split(separator: " ").map{ Int(String($0))! }
    array.append(now)
}
array.removeLast()

var result : [Int] = []
for i in array {
    let L = i[0]
    let P = i[1]
    let V = i[2]
    
    result.append((V/P)*L + (min(V%P, L)))
}

for i in 1...result.count {
    print("Case \(i): \(result[i - 1])")
}
