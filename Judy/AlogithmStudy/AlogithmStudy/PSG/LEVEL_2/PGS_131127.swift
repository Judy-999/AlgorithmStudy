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
