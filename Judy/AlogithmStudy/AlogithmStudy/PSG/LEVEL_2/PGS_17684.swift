//
//  PGS_17684.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/15.
//  https://school.programmers.co.kr/learn/courses/30/lessons/17684#

func answer_PGS_압축(_ msg: String) -> [Int] {
    var dic = [String: Int]()
    var result = [Int]()
    
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ".forEach {
        dic[String($0)] = dic.count + 1
    }
    
    var file = Array(msg.map { String($0) }.reversed())
    var words = file.popLast()!
    var number = 0
    var next = ""
    
    while file.isEmpty == false {
        if let num = dic[words] {
            number = num
            if let last = file.popLast() {
                next = last
                 words += last
            }
            continue
        }
        
        dic[words] = dic.count + 1
        result.append(number)
        words = next
    }
    
    if let num = dic[words] {
        result.append(num)
    } else {
        let last = String(words.popLast()! )
         result.append(dic[words]!)
        result.append(dic[last]!)
    }
    
    return result
}
