//
//  main.swift
//  2023KAKAO.B.R.no.1
//
//  Created by 노영재 on 2023/03/07.
//

import Foundation

import Foundation
var MAXDAY = 28
func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var result : [Int] = []
    var termsArr = [[String]](repeating: [], count: terms.count)
    for i in 0..<terms.count {
        termsArr[i] = terms[i].split(separator: " ").map{ String($0) }
    }
    
    var privArr = [[String]](repeating: [], count: privacies.count)
    for i in 0..<privacies.count {
        privArr[i] = privacies[i].split(separator: " ").map{ String($0) }
    }
    
    for i in 0..<privArr.count {
        let check = privArr[i][1]
        
        for j in 0..<termsArr.count {
            if check != termsArr[j][0] {
                continue
            } else {
                if Check(today, privArr[i][0], Int(termsArr[j][1])!) {
                    result.append(i + 1)
                }
            }
        }
    }
    
    return result
}

func Check(_ today: String, _ priv: String, _ terms: Int) -> Bool {
    let todayArr = today.split(separator: ".").map{ Int(String($0))! }
    var privArr = priv.split(separator: ".").map{ Int(String($0))! }
    
    privArr[1] += terms
    privArr = solve(privArr)
    print(privArr[0], todayArr[0])
    if todayArr[0] > privArr[0] {
        return true
    } else if todayArr[0] == privArr[0] {
        if todayArr[1] > privArr[1] {
            return true
        } else if todayArr[1] == privArr[1] {
            if todayArr[2] >= privArr[2] {
                return true
            }
        }
    }
    return false
}

func solve(_ date: [Int]) -> [Int] {
    var now = date
    var years = 0
    var d = date[1]
    if date[1] > 12 {
        if date[1]%12 == 0 {
            years = date[1]/12 - 1
            d = 12
        } else {
            years = date[1]/12
            d = d%12
        }
        
        now[0] = now[0] + years
        now[1] = d
    }
    
    return now
}
