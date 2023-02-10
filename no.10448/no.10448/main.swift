//
//  main.swift
//  no.10448
//
//  Created by 노영재 on 2023/02/03.
//

import Foundation

let N = Int(readLine()!)!

var arr = [Int](repeating: 0, count: 51)

for i in 1...50 {
    arr[i] = (i * (i + 1))/2
}
var result = false
func solve(_ num: Int,_ d: Int) {
    if d == 3 && num == 0 {
        result = true
        return
    }
    
    if d == 3 {
        return
    }
    if num == 0 {
        return
    }
    for i in 1...num {
        if num - arr[i] < 0 {
            return
        }
        
        solve(num - arr[i], d + 1)
    }
}


for _ in 1...N {
    let n = Int(readLine()!)!
    
    solve(n, 0)
    print(result ? 1 : 0)

    result = false
}

