//
//  main.swift
//  no.2104
//
//  Created by 노영재 on 2022/12/26.
//

import Foundation

let N = Int(readLine()!)!

let read = readLine()!.split(separator: " ").map{ Int($0)! }

var array : [Int] = read

func solve(lt : Int, rt : Int) -> Int {
    if lt == rt { return array[lt] * array[rt] }
    let mid = (lt + rt)/2
    var result = max(solve(lt: lt, rt: mid), solve(lt: mid + 1, rt: rt))
    
    var l = mid
    var r = mid + 1
    var mn = min(array[l], array[r])
    var sum = array[l] + array[r]
    
    result = max(result, (sum * mn))

    while lt < l || r < rt {
        if (r < rt && (l == lt || array[l - 1] < array[r + 1])) {
            r += 1
            mn = min(mn, array[r])
            sum += array[r]
        } else {
            l -= 1
            
            mn = min(array[l], mn)
            sum += array[l]
        }
        
        result = max(result, sum * mn)
    }
    
    return result
}

print(solve(lt: 0, rt: N - 1))


