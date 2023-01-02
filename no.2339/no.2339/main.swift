//
//  main.swift
//  no.2339
//
//  Created by 노영재 on 2022/12/30.
//

import Foundation

let N = Int(readLine()!)!

var arr = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)

for i in 0..<N {
    arr[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
}

// true면 가로로, fals면 세로로 자르기
func available(_ sy: Int, _ sx: Int, _ ey: Int, _ ex: Int) -> (Int, Int) {
    var jew = 0
    var tra = 0
    for i in sy...ey {
        for j in sx...ex {
            if arr[i][j] == 1 {
                tra += 1
            } else if arr[i][j] == 2 {
                jew += 1
            }
        }
    }
    return (jew, tra)
}


func divide(_ sy: Int, _ sx: Int, _ ey: Int, _ ex: Int, _ slice : Bool) -> Int {
    let (jew, tra) = available(sy, sx, ey, ex)
    if jew == 1 && tra == 0 {
        return 1}
    else if tra == 1 && jew == 1 { return 0 }
    else if jew == 0 { return 0 }
    else if jew > 1 && tra == 0 { return 0}

    var result = 0
    
    for i in sy...ey {
        for j in sx...ex {
            if arr[i][j] == 1 {
                if(slice) {
                    if sx != j && j != ex {
                        var check = true
                        for k in sy...ey {
                            if arr[k][j] == 2 {
                                check = false
                                break
                            }
                        }
                        if check {
                            result = result + divide(sy, sx, ey, j - 1, false) * divide(sy, j + 1, ey, ex, false)
                        }
                    }
                } else {
                    if sy != i && ey != i {
                        var check = true
                        for k in sx...ex {
                            if arr[i][k] == 2 {
                                check = false
                                break
                            }
                        }
                        if check {
                            result = result + divide(sy, sx, i - 1 , ex, true) * divide(i + 1 , sx, ey, ex, true)
                        }
                    }
                }
            }
        }
    }
    
    return result
}


let case1 = divide(0, 0, N - 1, N - 1, false)
let case2 = divide(0, 0, N - 1, N - 1, true)
let (jew, tra) = available(0, 0, N - 1, N - 1)

if jew == 1 && tra == 0 {
    print(1)
} else {
    if case1 + case2 == 0 {
        print(-1)
    } else {
        print(case1 + case2)
    }
}

