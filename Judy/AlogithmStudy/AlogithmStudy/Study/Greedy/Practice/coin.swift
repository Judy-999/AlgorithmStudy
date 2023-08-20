//
//  coin_01.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/08/04.
//

import Foundation

func coin_01(_ n: Int) -> [Int] {
    let coins = [500, 100, 50, 10]
    var money = n
    var result: [Int] = []
    
    for coin in coins { // 모든 동전에 대해 반복
        result.append(money / coin) // 현재 동전으로 가능한 개수 = 나눈 몫
        money %= coin   // 남은 금액
    }
    
    return result
}

/*
 입력: coin_01(1260)
 결과: [2, 2, 1, 1]
 */

