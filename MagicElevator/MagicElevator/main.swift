//
//  main.swift
//  MagicElevator
//
//  Created by 노영재 on 2023/04/06.
//

import Foundation

func solution(_ storey:Int) -> Int {
    var num = storey
    var answer = 0
    while num != 0 {
        let re = num%10
        
        if re != 0 {
            if re > 5 {
                answer += (10 - re)
                num += (10 - re)
            } else if re == 5 && num%100 >= 50 {
                answer += (10 - re)
                num += (10 - re)
            } else {
                answer += re
                num -= re
            }
        }
        num = num/10
    }
    return answer
}

print(solution(2554))
