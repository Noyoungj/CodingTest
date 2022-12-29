//
//  main.swift
//  no.2447
//
//  Created by 노영재 on 2022/12/29.
//

import Foundation

let N = Int(readLine()!)!

var arr = [[String]](repeating: [String](repeating: "*", count: N), count: N)

func solve( _ y: Int, _ x: Int, _ num: Int) {
    if num == 3 {
        arr[y + 1][x + 1] = " "
        return
    } else {
        let m1 = num/3
        let m2 = m1 * 2
        
        for i in m1..<m2 {
            for j in m1..<m2 {
                arr[y + i][x + j] = " "
            }
        }
    }
    
    for i in 0..<3 {
        for j in 0..<3 {
            solve(y + i * num/3, x + j * num/3, num/3)
        }
    }
}

solve(0, 0, N)

for i in arr {
    print(i.joined())
}
