import Foundation

let read = readLine()!.split(separator: " ").map{ Int($0)! }
let N = read[0]
let K = read[1]
let MAXN = 101
let MAXK = 100001

var dp = [[Int]](repeating: [Int](repeating: 0, count: MAXK), count: MAXN)
var W = [Int](repeating: 0, count: MAXN)
var V = [Int](repeating: 0, count: MAXK)

for i in 1...N {
    let r = readLine()!.split(separator: " ").map{ Int($0)! }
    W[i] = r[0]
    V[i] = r[1]
}

for i in 1...N {
    for j in 1...K {
        if j - W[i] < 0 { dp[i - 1][j] }
        else { dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - W[i]] + V[i]) }
    }
}

print(dp[N][K])
