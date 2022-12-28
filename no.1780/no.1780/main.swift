//
//  main.swift
//  no.1780
//
//  Created by 노영재 on 2022/12/28.
//

import Foundation

let N = Int(readLine()!)!

var arr = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)

for i in 0..<N {
    let read = readLine()!.split(separator: " ").map{ Int(String($0))! }
    
    arr[i] = read
}

var result = [0, 0, 0]

func check(_ sy: Int, _ sx: Int, _ size: Int) -> Bool {
    let start = arr[sy][sx]
    var bool = true
    for i in 0..<size {
        for j in 0..<size {
            if arr[sy + i][sx + j] != start {
                bool = false
                break
            }
        }
    }
    
    return bool
}

func devide(_ sy: Int, _ sx: Int, _ size : Int) {
    if check(sy, sx, size) {
        switch arr[sy][sx] {
        case -1:
            result[0] += 1
        case 0:
            result[1] += 1
        case 1:
            result[2] += 1
        default:
            print("check")
        }
    } else {
        let s = size/3
        
        for i in 0..<3{
            for j in 0..<3 {
                devide(sy + i * s, sx + j * s, s)
            }
        }
    }
}

devide(0, 0, N)

for i in result {
    print(i)
}
