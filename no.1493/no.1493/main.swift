//
//  main.swift
//  no.1493
//
//  Created by 노영재 on 2022/12/22.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let L = input[0]
let W = input[1]
let H = input[2]
let V = L * W * H

let N  = Int(readLine()!)!

var arr = [Int](repeating: 0, count: N)

for i in 0..<N {
    arr[i] = readLine()!.split(separator: " ").map{ Int($0)! }[1]
}

var i = N - 1
var nowL = L
var nowW = W
var nowH = H
var nowV = V
var result = 0
var reN : [Int] = []

while i >= 0 {
    var num = arr[i]
    let l = Int(pow(2.0 , Float(i)))
    let n = (nowL/l) * (nowH/l) * (nowW/l)
    print(l, l * l * l, nowV ,nowL, nowW,nowW, reN)
    while !reN.isEmpty {
        var v = reN.removeFirst()
        let m = v/(l * l * l)
        if num > m {
            num -= m
            result += m
        } else {
            print("아?")
            v -= (m - n) * l * l * l
            result += (m - n)
            reN.append(v)
        }
    }
    
    if n == 0 {
        i -= 1
        continue
    }
    
    if num < n {
        reN.append((n - num) * l * l * l)
        result += num
    } else {
        result += n
    }
    nowL = nowL%l
    nowW = nowW%l
    nowH = nowH%l
    nowV -= n * l * l * l
    i -= 1
}
print(result)
print(nowV == 0 ? result : -1)
