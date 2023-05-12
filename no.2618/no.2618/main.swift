//
//  main.swift
//  no.2618
//
//  Created by 노영재 on 2023/05/12.
//

import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!

var arr = [[Int]](repeating: [], count: M)
for i in 0..<M {
    arr[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
}



