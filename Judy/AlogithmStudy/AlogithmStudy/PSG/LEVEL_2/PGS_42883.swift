//
//  PGS_42883.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/13.
//

import Foundation
// 거의 질문 문답 보고 함
func answer_PGS_큰수만들기(_ number:String, _ k:Int) -> String {
    let count = number.count - k // 만들어질 숫자의 자리수
    var num = [Character]() // 만든 결과 숫자
    var start = number.startIndex
    var end = number.index(start, offsetBy: number.count - count) // 비교할 자리수까지 ex) 하나만 남기도 다 버려도 뒤에 숫자로 채워질 자리수
    
    while num.count < count { // 만들어진 숫자가 결과 자리수보다 작을 때까지
        // 뭐든 9가 나오면 짱
        if number[start...end].contains("9") { // (이부분 없으면 8, 9번 시간 초과)
            num.append("9") // 아묻따 9추가
            let index = number[start...end].firstIndex(of: "9")!  // 9 위치 찾기
            start = number.index(after: index) // index 위치만큼 이동
            end = number.index(after: end)
            continue
        }
        
        let max = number[start...end].max()! // 해당 구간에서 큰 수 찾기
        num.append(max) // 이하 동문
        let index = number[start...end].firstIndex(of: max)!
        start = number.index(after: index)
        end = number.index(after: end)
    }
    
    return String(num)
}

// 참고할 만한 풀이
//func solution(_ number: String, _ k: Int) -> String {
//    var result: [Int] = []
//    var count: Int = 0
//
//    Array(number).compactMap { Int(String($0)) }.forEach { item in
//        while count < k {
//            if let last = result.last, last < item {
//                result.popLast()
//                count += 1
//            } else {
//                break
//            }
//        }
//        result.append(item)
//    }
//
//    return result[0..<(result.count - k + count)].map { "\($0)" }.joined()
//}

//7, 8, 9, 10 시간 초과
//func solution(_ number:String, _ k:Int) -> String {
//    let count = number.count - k
//    var numbers = number
//    var num = ""
//    var index = 1
//
//    while index <= count {
//        num += String(numbers.removeFirst())
//        index += 1
//    }
//
//    for c in numbers {
//        num += "\(c)"
//        var strIndex = num.startIndex
//        while true {
//            let next = num.index(after: strIndex)
//            if next == num.endIndex { break }
//            if num[strIndex] < num[next] { break }
//            strIndex = next
//        }
//
//        num.remove(at: strIndex)
//    }
//
//    return num
//}
