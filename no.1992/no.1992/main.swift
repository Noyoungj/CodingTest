//
//  main.swift
//  no.1992
//
//  Created by 노영재 on 2022/12/29.
//

import Foundation

let N = Int(readLine()!)!

var arr = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
for i in 0..<N {
    let read = readLine()!.map{ Int(String($0))! }
    arr[i] = read
}

func Check(_ y: Int, _ x :Int, _ n : Int) -> Bool {
    var bool = true
    var start = arr[y][x]
    
    for i in 0..<n {
        for j in 0..<n {
            if start != arr[y + i][x + j] {
                bool = false
                break
            }
        }
    }
    
    return bool
}

var result : [String] = []
func solve(_ y: Int, _ x: Int, _ n :Int) {
    if Check(y, x, n) {
        let start = arr[y][x]
        result.append(String(start))
    } else {
        let mid = n/2
        
        result.append("(")
        solve(y, x, n/2)
        solve(y, x + n/2, n/2)
        solve(y + n/2, x, n/2)
        solve(y + n/2, x + n/2, n/2)
        result.append(")")
    }
}

solve(0, 0, N)
print(result.joined())
