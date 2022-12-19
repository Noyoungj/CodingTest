
import Foundation

func DFS(_ idx : Int, _ computer: [[Int]],visited: inout [Bool], _ n: Int) {
    for i in 0..<n {
        if idx == i || visited[i] {
            continue
        }
        
        if computer[idx][i] == 1 {
            visited[i] = true
            DFS(i, computer ,visited: &visited, n)
        }
        
    }
}

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = [Bool](repeating: false, count: n)
    var answer = 0
    
    for i in 0..<n {
        if visited[i] {
            continue
        }
        
        answer += 1
        visited[i] = true
        DFS(i, computers,visited: &visited, n)
    }
    
    return answer
}

print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]))
print(solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]]))
