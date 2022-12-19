//
//  main.swift
//  기능개발
//
//  Created by 노영재 on 2022/06/17.
//

import Foundation

func solution(_ priorities: [Int], _ location:Int) -> Int {
    var answer : Int = 0
    var printerIndex : [Int] = []
    var printer : [Int] = priorities
    var completedPrint : [Int] = []
    
    for i in 0..<printer.count {
        printerIndex.append(i)
    }
    
    while(!printerIndex.isEmpty) {
        let nowIndex = printerIndex.removeFirst()
        
        let max = Int(printer.max() ?? 0)
        if printer[nowIndex] < max {
            printerIndex.append(nowIndex)
        } else {
            completedPrint.append(nowIndex)
            printer[nowIndex] = -1
        }
    }
    
    for i in 0..<completedPrint.count {
        if completedPrint[i] == location {
            answer = i + 1
        }
    }
    print(answer)
    return answer
}

solution([2, 1, 3, 2], 2)
solution([1, 1, 9, 1, 1, 1], 0)
