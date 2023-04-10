//
//  main.swift
//  MaxMin
//
//  Created by 노영재 on 2023/04/10.
//

import Foundation

func solution(_ s:String) -> String {
    var arr = s.split(separator: " ").map{ Int(String($0))! }
    return "\(arr.min()!) \(arr.max()!)"
}
