//
//  main.swift
//  no.1725
//
//  Created by 노영재 on 2022/12/27.
//

import Foundation

let N = Int(readLine()!)!

var arr : [Int] = []

for _ in 0..<N {
    arr.append(Int(readLine()!)!)
}

var result = 0

func solve(lt: Int, rt: Int) -> Int {
    if (lt == rt) { return arr[lt]}
    let mid = (lt + rt)/2
    var l = mid
    var r = mid + 1
    
    var sum = max(solve(lt: lt, rt: l), solve(lt: r, rt: rt))
    
    var m = min(arr[l], arr[r])
    sum = max(sum, m * (r - l + 1))
    while lt < l || rt > r {
        if (r < rt && (l == lt || arr[l - 1] < arr[r + 1] )) {
            r += 1
            m = min(arr[r], m)
        } else {
            l -= 1
            m = min(arr[l], m)
        }
        sum = max(sum, m * (r - l + 1))
    }
    return sum
}

print(solve(lt: 0, rt: N - 1))
