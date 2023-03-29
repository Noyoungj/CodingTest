import Foundation

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    var section : [[String]] = []
    var min = minerals
    var p = picks
    var result = 0
    var MAX = picks.reduce(0) { $0 + $1 } * 5
    
    while (min.count%5 != 0) {
        min.append("")
    }
    print(MAX)
     var N = 0
    if MAX >= min.count {
        N = min.count/5
    } else {
        N = MAX/5
    }
    
    for i in 0..<N {
        var sec : [String] = []
        for j in 0..<5 {
            let m = min.removeFirst()
            sec.append(m)
        }
        
        section.append(sec)
    }
        
    for i in 0..<section.count {
        var n = 0
        for j in 0..<5 {
            switch section[i][j] {
                case "diamond":
                    n += 25
                case "iron":
                    n += 5
                case "stone":
                    n += 1
                default:
                    n += 0
            }
        }
        
        section[i].append("\(n)")
    }
    
    section.sort(by: { Int($0[5])! > Int($1[5])! })
    
    while( !section.isEmpty ) {
        let now = section.removeFirst()
        
        var pick = 0
        
        if p[0] != 0 {
            pick = 25
            p[0] -= 1
        } else if p[1] != 0 {
            pick = 5
            p[1] -= 1
        } else if p[2] != 0 {
            pick = 1
            p[2] -= 1
        } else {
            break
        }
        
        for i in 0..<5 {
            if now[i] == "diamond" {
                result += (25/pick == 0 ? 1 : 25/pick)
            } else if now[i] == "iron" {
                result += (5/pick == 0 ? 1 : 5/pick)
            } else if now[i] == "stone" {
                result += 1
            } else {
                result += 0
            }
        }
    }

    return result
}
