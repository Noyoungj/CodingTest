//
//  main.swift
//  no.1449
//
//  Created by 노영재 on 2022/12/20.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }

var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
arr.sort()

var result = 0
var now = 0

for i in arr {
    if now < i {
        result += 1
        now = i + input[1] - 1
    }
}

print(result)
