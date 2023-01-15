//
//  main.swift
//  no.16500
//
//  Created by 노영재 on 2023/01/15.
//

import Foundation

let string = readLine()!.map{ String($0) }
let N = Int(readLine()!)!
let MAX = 101

var str = [[String]](repeating: [String](repeating: "", count: MAX), count: MAX)
var dp = [Int](repeating: 0, count: MAX)
dp[0] = 1
for i in 0..<N {
    str[i] = readLine()!.map{ String($0) }
}
for i in 0..<string.count {
    if dp[i] == 1 {
        for j in str {
            if i + j.count > string.count {
                continue
            }
            var bool = true
            for k in 0..<j.count {
                if j[k] != string[i + k] {
                    bool = false
                    break
                }
            }
            if bool {
                dp[i + j.count] = 1
            }
        }
    }
}


print(dp[string.count])
