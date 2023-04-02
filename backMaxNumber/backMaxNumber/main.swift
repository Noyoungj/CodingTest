//
//  main.swift
//  backMaxNumber
//
//  Created by 노영재 on 2023/04/02.
//
import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var stack : [Int] = []
    var result = [Int](repeating: -1, count: numbers.count)
    for i in 0..<numbers.count {
        let now = numbers[i]
        print(stack, i)
        while !stack.isEmpty && (numbers[stack[stack.count - 1]] < numbers[i]) {
            result[stack.removeLast()] = numbers[i]
        }
        stack.append(i)
    }
    return result
}
