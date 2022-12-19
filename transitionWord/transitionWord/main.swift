

import Foundation

func DFS(visited : inout [String], canVisit : inout [String], tickets: [[String]]) {
    
}

func solution(_ tickets:[[String]]) -> [String] {
    var visisted = [Bool](repeating: false, count: tickets.count)
    var ticket : [[String]] = tickets.sorted{ $0[1] < $1[1] }
    
    var result: [String] = []
    
    func DFS(now : String) {
        if result.count == ticket.count {
            result.append(now)
            return
        }
        
        for i in 0..<ticket.count {
            if ticket[i][0] == now && !visisted[i] {
                visisted[i] = true
                result.append(now)
                DFS(now: ticket[i][1])
                
                if result.count == ticket.count + 1 {
                    return
                }
                result.removeLast()
                visisted[i] = false
            }
        }
    }
    
    DFS(now: "ICN")
    
    return result
}

print(solution([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]))
print(solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]))

func solution1(_ tickets:[[String]]) -> [String] {
    // 도착지를 기준으로 알파벳 순서로 정렬한다.
    let tickets = tickets.sorted { $0[1] < $1[1] }
    // 티켓의 사용여부를 기록
    var visited = [Bool](repeating: false, count: tickets.count)
    
    var result: [String] = []
    
    func dfs(start: String) {
        // 현재 방문한 도시 수가 티켓 수와 같다면 지금 도착한 곳이 마지막 여행지
        if result.count == tickets.count {
            result.append(start)
            return
        }
        for i in 0..<tickets.count {
            if tickets[i][0] == start && !visited[i] {
                visited[i] = true
                result.append(start)
                dfs(start: tickets[i][1])
                // 정답을 이미 구했다면 return
                if result.count == tickets.count + 1 {
                    return
                }
                result.removeLast()
                visited[i] = false
            }
        }
    }
    
    // 시작은 항상 "ICN"이라고 문제에서 주어짐
    dfs(start: "ICN")
    
    return result
}
