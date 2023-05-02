//
//  main.swift
//  jewalshopping
//
//  Created by 노영재 on 2023/05/02.
//

import Foundation

func solution(_ gems:[String]) -> [Int] {
    var g = Set(gems)
    var now : [String: Int] = [:]
    
    var l = 0
    var r = 0
    var result = Int.max
    var s = 0
    var e = 0
    while true {
        print(l, r)
        if now.count == g.count {
            now[gems[l]]! -= 1
            if now[gems[l]] == 0 {
                now[gems[l]] = nil
            }
            l += 1
        } else if r == gems.count { break }
        else {
            if now[gems[r]] != nil {
                now[gems[r]]! += 1
            } else {
                now[gems[r]] = 1
            }
            r += 1
        }
        
        if now.count == g.count {
            if result > r - l {
                result = r - l
                s = l
                e = r
            }
        }
    }
    return [s, e]
}

print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]))
