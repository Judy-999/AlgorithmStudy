//
//  PGS_72411.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/11.
//  https://school.programmers.co.kr/learn/courses/30/lessons/72411

import Foundation

func answer_PGS_메뉴리뉴얼(_ orders:[String], _ course:[Int]) -> [String] {
    var result = [String]()
    var setDic = [String: Int]()
    
    func dfs(_ original: [String], _ array: String, _ depth: Int, _ index: Int) {
         if course.contains(depth) {
              setDic[array] = (setDic[array] ?? 0) + 1
         }

        for i in index..<original.count {
            let word = String((array + original[i]).sorted(by: <))
            dfs(original, word, depth + 1, i + 1)
        }
    }
    
    for order in orders {
        let words = order.map { String($0) }
        dfs(words, "", 0, 0)
    }
    
    for count in course {
        let countSet = setDic.filter { $0.key.count == count && $0.value >= 2 }
        let courses = countSet.filter { $0.value == countSet.values.max() }
        result += courses.keys
    }
    
    return result.sorted(by: <)
}
