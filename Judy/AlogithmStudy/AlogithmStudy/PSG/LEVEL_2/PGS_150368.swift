//
//  PGS_150368.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/22.
//  https://school.programmers.co.kr/learn/courses/30/lessons/150368

import Foundation
// 내가 푼 수준이 아님.. 다시 봐야하는 문제
func answer_PGS_이모티콘할인행사(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    var result = [0, 0]
    
    func dfs(_ users: [[Int]], _ emoticons: [Int], _ discounts: [Int], _ depth: Int) {
        if depth == emoticons.count {
            calculate(users, emoticons, discounts)
            return
        }
        
        let dis = [10, 20, 30, 40]
        for i in 0...3 {
            dfs(users, emoticons, discounts + [dis[i]], depth + 1)
        }
    }
    
    func calculate(_ users: [[Int]], _ emoticons: [Int], _ discounts: [Int]) {
        var joins = 0
        var totalSum = 0
        
        for user in users {
            let discount = user[0]
            let limit = user[1]
            var sum = 0
            let prices = discounts.map { discount <= $0 ? $0 : 100 }
            for (price, dis) in zip(emoticons, prices) {
                sum += price * (100-dis) / 100
            }
            sum >= limit ? (joins += 1) : (totalSum += sum)
        }
        
        if result[0] < joins {
            result = [joins, totalSum]
        } else if result[0] == joins && result[1] < totalSum {
            result[1] = totalSum
        }
    }
    
    dfs(users, emoticons, [], 0)
    
    return result
}
