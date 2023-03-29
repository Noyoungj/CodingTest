import Foundation

let dx = [1, 0 , -1, 0]
let dy = [0, 1 , 0, -1]

func solution(_ board:[String]) -> Int {
    var b = [[String]](repeating: [], count: board.count)
    
    for i in 0..<board.count {
        b[i] = board[i].map{ String($0) }
    }

    let MAXX = b[0].count
    let MAXY = b.count
    
    var sx = 0
    var sy = 0
    var ex = 0
    var ey = 0
    
    for i in 0..<MAXY {
        for j in 0..<MAXX {
            if b[i][j] == "R" {
                sx = j
                sy = i
            } else if b[i][j] == "G" {
                ex = j
                ey = i
            }
        }
    }
    var visited = [[Bool]](repeating : [Bool](repeating: false, count: MAXX), count: MAXY)
    var q : [(Int, Int, Int)] = [(sy, sx, 0)]
    var count = 0
    while (!q.isEmpty) {
        print(q)
        let (y, x, d) = q.removeFirst()
        if b[y][x] == "G" {
            count = d
            break
        }
        
        for i in 0..<4 {
            let (nextY, nextX) = direction(y, x, dy[i], dx[i])
            if !visited[nextY][nextX] {
                q.append((nextY, nextX, d + 1))
                visited[nextY][nextX] = true
            }
        }
    }
    
    func direction(_ ny: Int, _ nx: Int ,_ dy: Int, _ dx: Int) -> (Int, Int) {
        var nowY = ny
        var nowX = nx
        
        while(true) {
            let nextY = nowY + dy
            let nextX = nowX + dx

            if nextY >= 0 &&
            nextY < MAXY &&
            nextX >= 0 &&
            nextX < MAXX {
                if b[nextY][nextX] == "D" {
                    return (nowY, nowX)
                } else {
                    nowY = nextY
                    nowX = nextX
                }
            } else {
                return (nowY, nowX)
            }
        }
    }
    
    return 0
}

solution(["...D..R", ".D.G...", "....D.D", "D....D.", "..D...."])
