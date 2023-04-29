import Foundation

func solution(_ sticker:[Int]) -> Int{
    var answer = 0
    var dp = [Int](repeating: 0, count: sticker.count)
    var s = sticker
    if s.count == 1 {
        return s[0]
    }
    dp[0] = s[0]
    dp[1] = s[0]
    if dp.count > 2 {
        for i in 2..<dp.count - 1 {
            dp[i] = max(dp[i - 1], dp[i - 2] + s[i])
        }
    }
    
    var dp1 = [Int](repeating: 0, count: sticker.count)
    dp1[1] = s[1]
    for i in 2..<dp.count {
        dp1[i] = max(dp1[i - 1], dp1[i - 2] + s[i])
    }
    return max(dp1[sticker.count - 1], dp[sticker.count - 2])
}
