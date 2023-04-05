//
//  PGS_12953.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/05.
//  https://school.programmers.co.kr/learn/courses/30/lessons/12953

import Foundation

func answer_PGS_N개의최소공배수(_ arr:[Int]) -> Int {
    var list = arr
    var next = list.removeFirst()
    
    for num in list {
        next = LCM([next, num])
    }
    
    return next
}

func LCM(_ arr: [Int]) -> Int {
    var i = 2
    var iList = [Int]()
    var least = arr
    
    while i <= arr.min()! {
        if least.filter ({ $0 % i != 0 }).isEmpty {
            least = least.map { $0 / i }
            iList.append(i)
            continue
        }
        i += 1
    }
    
    return least.reduce(1, *) * iList.reduce(1, *)
}

// GCD를 이용한 방법
func lcm(_ a:Int, _ b:Int) -> Int {
    return (a * b) / gcd(a, b)
}

func gcd(_ a:Int, _ b:Int) -> Int {
    return a % b == 0 ? b : gcd(b, a % b)
}
