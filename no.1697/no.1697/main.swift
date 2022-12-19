//
//  main.swift
//  no.1697
//
//  Created by 노영재 on 2022/12/08.
//

import Foundation




func BFS() {
    
    while !needVisit.isEmpty {
        now = needVisit.removeFirst()
        let point = now[0]
        let time = now[1]

        if point == depart {
            break
        }
        
        let np1 = point - 1
        let np2 = point + 1
        let np3 = point * 2
        
        if np1 >= 0 && !visited[np1] {
            visited[np1] = true
            needVisit.append([np1, time + 1])
        }
        
        if np2 <= 100000 && !visited[np2] {
            visited[np2] = true
            needVisit.append([np2, time + 1])
        }
        if np3 < 100001 && !visited[np3] {
            visited[np3] = true
            needVisit.append([np3, time + 1])
        }
        
    }
}

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }

let start = input[0]
let depart = input[1]
var now : [Int] = []
var visited = [Bool](repeating: false, count: 100001)
var needVisit : [[Int]] = [ [start, 0] ]

BFS()

print(now[1])
