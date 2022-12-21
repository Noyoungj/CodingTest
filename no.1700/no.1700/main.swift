//
//  main.swift
//  no.1700
//
//  Created by 노영재 on 2022/12/21.
//

import Foundation

let NM = readLine()!.split(separator: " ").map{ Int($0)! }
let N = NM[0]
let K = NM[1]

var array : [Int] = []

readLine()!.split(separator: " ").map{ array.append(Int($0)!) }

var multiTap = [Int](repeating: 0, count: N)
array.reverse()
var result = 0
while !array.isEmpty {
    let now = array.removeLast()
    if multiTap.contains(0) {
        if multiTap.contains(now) {
            continue
        } else {
            multiTap[multiTap.firstIndex(of: 0)!] = now
        }
    }
    else {
        if multiTap.contains(now) { continue }
        if array.count > multiTap.count {
            var M = array.count
            var c = 0
            for i in multiTap {
                if !array.contains(i) {
                    c = i
                    break
                } else {
                    let nextS = array.lastIndex(of: i)!
                    M = min(M, nextS)
                }
            }
            if M == array.count {
                multiTap[0] = now
            } else if c != 0 {
                multiTap[multiTap.firstIndex(of: c)!] = now
            } else {
                multiTap[multiTap.firstIndex(of: array[M])!] = now
            }
            result += 1
        } else {
            for i in multiTap {
                if !array.contains(i) {
                    result += 1
                    multiTap[multiTap.firstIndex(of: i)!] = now
                    break
                }
            }
        }
        
    }
}
print(result)
