//
//  GymUniform.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/08/20.
//

import Foundation

func gymUniform(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int { // 3
    let chance = [0, -1, 2] // 여분 가져오고 도난, 왼쪽으로 빌려주기, 오른쪽으로 빌려주기
    let chance1 = [0, 1, -2] // [0, +1, -1]

    return n - min(check(chance, lost, reserve), check(chance1, lost, reserve))
}

func check(_ chance: [Int], _ lost: [Int], _ reserve: [Int]) -> Int {
    var losts = lost
    var reserves = reserve
    
    for c in chance {
        reserves = reserves.map { $0 + c } // 왼쪽 또는 오른쪽으로 빌려줄 수 있는 번호로 변경
        let intersection = Set(losts).intersection(reserves) // 도난 당한 번호와 교집합
        losts = losts.filter { !intersection.contains($0) } // 도난 번호에서 교집합 빼기
        reserves = reserves.filter { !intersection.contains($0) } // 여분 번호에서 교집합 빼기
    }
    
    return losts.count
}
// 5, [2, 4], [1, 3]





// 참고 답안
//func gymUniform1(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
//    var arr = lost.filter{ !reserve.contains($0) }.sorted() // 여분인데 도난인 번호 제거 및 정렬
//    var student = reserve.filter { !lost.contains($0) }.sorted() // 여분인데 도난인 번호 제거 및 정렬
//    for i in student {
//        if arr.contains(i-1) { // 왼쪽한테 빌릴 수 있는지 확인
//            arr.remove(at: arr.firstIndex(of: i-1)!) // 있으면 제거
//        } else if arr.contains(i+1) { // 아니면 오른쪽한테 빌릴 수 있는지 확인
//            arr.remove(at: arr.firstIndex(of: i+1)!) // 있으면 제거
//        }
//    }
//    return n - arr.count
//}
