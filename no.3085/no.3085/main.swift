//
//  main.swift
//  no.3085
//
//  Created by 노영재 on 2023/01/17.
//

import Foundation

var N = Int(readLine()!)!

var arr = [[String]](repeating: [String](repeating: "", count: N), count: N)

for i in 0..<N {
    arr[i] = readLine()!.map{ String($0) }
}
var result = 0

for i in 0..<N {
    for j in 0..<N - 1 {
        let t = arr[i][j]

        arr[i][j] = arr[i][j + 1]
        arr[i][j + 1] = t

        check()
        
        arr[i][j + 1] = arr[i][j]
        arr[i][j] = t
    }
}

for j in 0..<N {
    for i in 0..<N - 1 {
        let t = arr[i][j]
        arr[i][j] = arr[i + 1][j]
        arr[i + 1][j] = t

        check()
        
        arr[i + 1][j] = arr[i][j]
        arr[i][j] = t
    }
}

print(result)




func check() {
    for i in 0..<N {
        var count = 1
        var str = arr[i][0]
        for j in 1..<N {
            if str == arr[i][j] {
                count += 1
            } else {
                result = max(result, count)
                count = 1
            }
            str = arr[i][j]
        }
        result = max(result, count)
    }
    
    for i in 0..<N {
        var count = 1
        var str = arr[0][i]
        for j in 1..<N {
            if str == arr[j][i] {
                count += 1
            } else {
                result = max(result, count)
                count = 1
            }
            str = arr[j][i]
        }
        result = max(result, count)
    }
}


