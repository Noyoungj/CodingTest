//
//  main.swift
//  다리를 지나는 트럭
//
//  Created by 노영재 on 2022/06/20.
//

import Foundation


func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var completeTruck : [Int] = []
    var bridgeTruck : [Int] = []
    var waitTruck : [Int] = truck_weights
    var bridgeWeight : Int = 0
    
    
    while(completeTruck.count != truck_weights.count) {
        if bridgeTruck.count > bridge_length {
            completeTruck.append(bridgeTruck.removeFirst())
        }
        for i in 0..<bridgeTruck.count {
            bridgeWeight += bridgeTruck[i]
        }
        if bridgeWeight <= weight {
            bridgeTruck.append(waitTruck.removeFirst())
        } else {
            bridgeTruck.append(0)
        }
    }
    print(bridgeTruck)
    print(waitTruck)
    print(completeTruck)
    return 0
}

solution(2, 10, [7,4,5,6])
