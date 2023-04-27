//
//  main.swift
//  no.2075
//
//  Created by 노영재 on 2023/04/27.
//

import Foundation

let N = Int(readLine()!)!

var arr = [Int](repeating: 0, count: N)

for i in 0..<N {
    let a = readLine()!.split(separator: " ").map{ Int(String($0))! }
    arr += a
    arr.sort(by: >)
    
    for j in 0..<N {
        arr.removeLast()
    }
}

print(arr[N - 1])
