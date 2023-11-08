//
//  CurrencyComposition.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/10/27.
//

import Foundation

func currencyComposition() {
    let numbers = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    let count = numbers[0]
    let money = numbers[1]
    var coins = [Int]()
    
    for _ in 0..<count {
        let coin = Int(readLine()!)!
        coins.append(coin)
    }
    
    var dic = [Int: Int]()
    
    dic[0] = 0
    
    // 배수일 때, 있는 값이랑 더할 때
    for coin in coins {
        // (이미 만든 동전 조합 + 지금 동전) 경우
        dic.forEach { (targetCoin: Int, count: Int) in
            if targetCoin + coin <= money {
                let makeMoney = targetCoin + coin
                dic[makeMoney] = min((dic[targetCoin] ?? 0) + 1, dic[makeMoney] ?? 10001)
            }
        }

        // 지금 동전의 배수로 만드는 경우
        var num = 1
        while num * coin <= money {
            let makeMoney = num * coin
            dic[makeMoney] = min(dic[makeMoney] ?? 10001, num)
            num += 1
        }
    }
  
    print(dic[money] ?? -1)
}
