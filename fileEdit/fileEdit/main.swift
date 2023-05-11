//
//  main.swift
//  fileEdit
//
//  Created by 노영재 on 2023/05/06.
//

import Foundation

let N = Int(readLine()!)!
var result : [Int] = []
for _ in 0..<N {
    let M = Int(readLine()!)!
    var arr =  [0] + readLine()!.split(separator: " ").map{ Int(String($0))! }
    var dp = [[Int]](repeating: [Int](repeating: 0, count: M + 1), count: M + 1)
    var sum = [Int](repeating: 0, count: arr.count + 1)
    sum[1] = arr[1]

    for i in 1...M {
        sum[i] = arr[i] + sum[i - 1]
    }
    
    for i in 1...M {
        if M - i == 0 { continue }
        for j in 1...M - i {
            dp[j][i + j] = Int.max
            
            for k in j..<i + j {
                dp[j][i + j] = min(dp[j][i + j], dp[j][k] + dp[k + 1][i + j] + sum[i + j] - sum[j - 1])
            }
        }
    }
    result.append(dp[1][M])
}

for i in result {
    print(i)
}
