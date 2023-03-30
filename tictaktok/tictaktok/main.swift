//
//  main.swift
//  tictaktok
//
//  Created by 노영재 on 2023/03/30.
//

import Foundation

func solution(_ board:[String]) -> Int {
    var b = [[String]](repeating: [], count: 3)
    
    for i in 0..<3 {
        b[i] = board[i].map{ String($0) }
    }
    
    var oCount = 0
    var xCount = 0
    
    var oWin = 0
    var xWin = 0
    
    for i in 0..<3 {
        for j in 0..<3 {
            if b[i][j] == "O" {
                oCount += 1
            } else if b[i][j] == "X" {
                xCount += 1
            }
        }
    }
    
    if xCount > oCount {
        return 0
    }
    if oCount > xCount + 1 {
        return 0
    }
    
    if xCount + oCount == 0 {
        return 1
    }
    
    for i in 0..<3 {
        if (b[i][0] == b[i][1] && b[i][1] == b[i][2]) {
            if b[i][0] == "O" {
                oWin += 1
            } else if b[i][0] == "X" {
                xWin += 1
            }
        }
        
        if b[0][i] == b[1][i] && b[1][i] == b[2][i] {
            if b[0][i] == "O" {
                oWin += 1
            } else if b[0][i] == "X" {
                xWin += 1
            }
        }
    }
    
    if b[0][0] == b[1][1] && b[1][1] == b[2][2] {
        if b[0][0] == "O" {
                oWin += 1
            } else if b[0][0] == "X" {
                xWin += 1
            }
    }
    
    if b[2][0] == b[1][1] && b[0][2] == b[1][1] {
        if b[2][0] == "O" {
                oWin += 1
            } else if b[2][0] == "X" {
                xWin += 1
            }
    }
    
    if oWin + xWin == 0 {
        return 1
    }
    
    if oWin > 0 && xWin == 0 {
        if oCount > xCount {
            return 1
        }
    }
    
    if oWin == 0 && xWin > 0 {
        if oCount == xCount {
            return 1
        }
    }
    
    return 0
}
