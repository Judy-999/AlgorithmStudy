//
//  BOJ_1541.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/26/24.
//

import Foundation

//55-50+40

func answer_BOJ_잃어버린괄호_1541() {
    let formula = readLine()!
    let onlyPlus = formula.split(separator: "-").map { $0.split(separator: "+").compactMap { Int($0) }.reduce(0, +) }
    let result = onlyPlus[1...].reduce(onlyPlus[0], -)
    
    print(result)
}

// 최소가 되려면 - 뒤에가 커지면 됨 = +인 것을 다 더해버리면 큰 수를 뺄 수 있음 = 먼저 다 더하기를 하고 이후에 빼기를 수행하면 됨


//var result = Int.max
//func calculate(_ num: Int, _ numbers: [Int], _ operators: [String]) {
//    guard !operators.isEmpty else {
//        result = min(result, num)
//        return
//    }
//    
//    for i in operators.indices {
//        let o = Operator2(rawValue: operators[i])!
//        let n = o.calculate(numbers[i], numbers[i + 1])
//        var operators = operators
//        operators.remove(at: i)
//        calculate(n, Array(numbers[0..<i] + [n] + numbers[(i + 2)...]), operators)
//    }
//}
//
//calculate(0, numbers, operators)
//print(result)


