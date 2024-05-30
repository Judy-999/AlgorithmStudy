//
//  PGS_131127.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/12.
//  https://school.programmers.co.kr/learn/courses/30/lessons/131127

import Foundation

func answer_PGS_할인행사(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var dic = [String: Int]()
    var count = 0
    
    zip(want, number).forEach { thing, count in
        dic[thing] = count
    }
    
    for i in 0...(discount.count - 10) {
       if check(dic, Array(discount[i..<(i + 10)])) { count += 1 }
    }
    
    return count
}

func check(_ dic: [String: Int], _ discount: [String]) -> Bool {
    for d in dic {
        if discount.filter({ $0 == d.key }).count < d.value {
            return false
        }
    }
    
    return true
}

// 스터디로 새로운 풀이
func answer_PGS_할인행사2(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var wantList: [String] = []
    var result = 0
    var index = 0
    
    for (sttuf, count) in zip(want, number) {
        (0..<count).forEach { _ in wantList.append(sttuf) }
        // 원하는 리스트 만들기 ex) [바나나, 바나나, 바나나, 사과, 사과, 딸기]
    }
    
    wantList.sort(by: <) // 정렬
    
    while index + 10 <= discount.count {
        // 할인 리스트를 10개로 자르고 정렬
        let discountList = Array(discount[index..<(index + 10)]).sorted(by: <)
        if wantList == discountList { result += 1 } // 원하는 리스트와 같으면 하루 추가
        index += 1 // 다음 10개를 자를 기준 +1
    }
    
    return result
}
