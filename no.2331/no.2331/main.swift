//
//  main.swift
//  no.2331
//
//  Created by 노영재 on 2022/12/06.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }

let A = input[0]
let P = input[1]

var result : [Int] = []
var nowNum : Int = A

while !result.contains(nowNum) {
    result.append(nowNum)
    let array : [Int] = String(nowNum).map{ Int(String($0))! }
    nowNum = 0
    for i in array {
        nowNum += Int(pow(Double(i), Double(P)))
    }
}

for (i, element) in result.enumerated() {
    if element == nowNum {
        print(i)
    }
}
