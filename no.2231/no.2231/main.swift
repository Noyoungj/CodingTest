//
//  main.swift
//  no.2231
//
//  Created by 노영재 on 2023/01/17.
//

import Foundation

let N = Int(readLine()!)!

var result = 0
for i in 1...N {
    let intArr : [Int] = String(i).map{ Int(String($0))! }
    
    if N == (intArr.reduce(0) { $0 + $1 } + i) {
        result = i
        break
    }
}

print(result)
