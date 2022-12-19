import Foundation

//  n개의 음이 아닌 정수들이 있습니다. 이 정수들을 순서를 바꾸지 않고 적절히 더하거나 빼서 타겟 넘버를 만들려고 합니다. 예를 들어 [1, 1, 1, 1, 1]로 숫자 3을 만들려면 다음 다섯 방법을 쓸 수 있습니다. 사용할 수 있는 숫자가 담긴 배열 numbers, 타겟 넘버 target이 매개변수로 주어질 때 숫자를 적절히 더하고 빼서 타겟 넘버를 만드는 방법의 수를 return 하도록 solution 함수를 작성해주세요.

func DFS(_ nums: [Int], _ depth : Int, _ value : Int,_ target : Int, answer: inout Int) {
    if nums.count <= depth {
        if target == value { answer += 1 }
        
        return
    }
    
    DFS(nums, depth + 1, value + nums[depth], target, answer: &answer)
    DFS(nums, depth + 1, value - nums[depth], target, answer: &answer)
}

func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    var answer = 0
    
    DFS(numbers, 0, 0, target, answer: &answer)
    
    return answer
}


print(solution([1, 1, 1, 1, 1], 3))
