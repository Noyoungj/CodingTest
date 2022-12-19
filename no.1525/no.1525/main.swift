//
//  main.swift
//  no.1525
//
//  Created by 노영재 on 2022/12/14.
//
class Dequeue<T> {
    var enQueue: [T]
    var deQueue: [T] = []
    
    var count: Int {
        return enQueue.count + deQueue.count
    }
    
    var isEmpty: Bool {
        return enQueue.isEmpty && deQueue.isEmpty
    }
    
    init(_ queue: [T]) {
        enQueue = queue
    }
    
    func pushLast(_ element: T) {
        enQueue.append(element)
    }
    
    func pushFirst(_ element: T) {
        deQueue.append(element)
    }
    
    func popLast() -> T {
        if enQueue.isEmpty {
            enQueue = deQueue.reversed()
            deQueue.removeAll()
        }
        return enQueue.popLast()!
    }
    
    func popFirst() -> T {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.popLast()!
    }
}

import Foundation

var array : [String] = []
for _ in 0..<3 {
    let input = readLine()!.split(separator: " ").map{String($0)}
    array.append(input[0])
    array.append(input[1])
    array.append(input[2])
}


var startY: Int = 0
var startX: Int = 0
for i in 0..<9 {
    if array[i] == "0" {
        startY = i/3
        startX = i%3
        break
    }
}
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

func BFS() -> Int {
    let queue = Dequeue([(startY, startX,0, array)])
    var visited : Set = [ array ]
    var answer = -1
    while !queue.isEmpty {
        var (y, x, count, arr) = queue.popFirst()
        let string = arr.map{ String($0) }.joined()
        if string == "123456780" {
            answer = count
            break
        }
        for i in 0..<4 {
            let nextX = x + dx[i]
            let nextY = y + dy[i]
            

            if nextX >= 0 &&
                nextX < 3 &&
                nextY >= 0 &&
                nextY < 3 {
                
                let index = 3*y + x
                let nextIndex = 3*nextY + nextX
                arr[index] = arr[nextIndex]
                arr[nextIndex] = "0"


                if !visited.contains(arr) {
                    visited.insert(arr)
                    queue.pushLast((nextY, nextX, count + 1, arr))
                }
                
                arr[nextIndex] = arr[index]
                arr[index] = "0"
            }
        }
    }
    
    return answer
}

print(BFS())

