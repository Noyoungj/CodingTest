//
//  main.swift
//  hotelBooking
//
//  Created by 노영재 on 2023/04/02.
//

import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var time = book_time.sorted(by: { $0[0] < $1[0] })
    var room = [(0, 0)]
    
    while(!time.isEmpty) {
        let t = time.removeFirst()
        let firstT = t[0].split(separator: ":").map{ Int(String($0))! }
        var secondT = t[1].split(separator: ":").map{ Int(String($0))! }
        var bool = false
        
        if secondT[1] + 10 > 59 {
            secondT[0] += 1
            secondT[1] -= 60
        }
        for i in 0..<room.count {
            let nowT = room[i]
            
            if firstT[0] > nowT.0 {
                room[i] = (secondT[0], secondT[1] + 10)
                bool = true
                break
            } else if firstT[0] == nowT.0 {
                if firstT[1] >= nowT.1 {
                    room[i] = (secondT[0], secondT[1] + 10)
                    bool = true
                    break
                }
            }
        }
        
        if !bool {
            room.append((secondT[0], secondT[1] + 10))
        }
    }
    return room.count
}
