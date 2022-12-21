//
//  main.swift
//  no.11000
//
//  Created by 노영재 on 2022/12/20.
//

import Foundation

let N = Int(readLine()!)!

var array : [(Int, Int)] = []

for _ in 0..<N {
    let input = (readLine()!.split(separator: " ").map{ Int($0)! })
    
    array.append((input[0], input[1]))
}

array.sort { first, second in
        return first.0 < second.0
}

var now : [Int] = [array[0].1]
for i in 1..<array.count {
    let min = now.min()!
    if array[i].0 >= min {
        now.remove(at: now.firstIndex(of: min)!)
        now.append(array[i].1)
    } else {
        now.append(array[i].1)
    }
}
print(now.count)
