//
//  main.swift
//  no.1629
//
//  Created by 노영재 on 2022/12/26.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
var s = input[0]
var m = input[1]
let d = input[2]
var result = 0

func div(_ n: Int, _ j: Int) -> Int {
    if j == 1 {
        return n % d
    }
    
    let temp = div(n, j/2)
    
    if( j % 2 == 1) {
        return (((temp * temp) % d) * (n % d)) % d
    }
    
    return (temp * temp) % d
}


print(div(s, m))
