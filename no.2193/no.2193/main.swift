//
//  main.swift
//  no.2193
//
//  Created by 노영재 on 2023/01/05.
//

import Foundation

let N = Int(readLine()!)!

var arr : [Int] = [0, 1]

for _ in 1..<N {
    arr = [arr[1] + arr[0], arr[0]]
}

print(arr[1] + arr[0])

