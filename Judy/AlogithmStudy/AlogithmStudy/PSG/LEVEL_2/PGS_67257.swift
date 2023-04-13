//
//  PGS_67257.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/04/13.
//  https://school.programmers.co.kr/learn/courses/30/lessons/67257

import Foundation

func answer_PGS_수식최대화(_ expression:String) -> Int64 {
    let operatorList = ["*", "+", "-"]
    var priorities = [[String]]()

    func dfs(_ operators: [String], _ depth: Int) {
        if depth == 3 {
            priorities.append(operators)
            return
        }

        let remains = operatorList.filter { operators.contains($0) == false }
        for remain in remains {
            dfs(operators + [remain], depth + 1)
        }
    }
    dfs([], 0)

    var result = [Int64]()
    for priority in priorities {
        var exp = expression
        for opr in priority {
            exp = calculate(opr, exp)
        }

        result.append(abs(Int64(exp)!))
    }


    return result.max()!
}

func calculate(_ opr: String, _ expression: String) -> String {
    var number = ""
    var expressions = [String]()
    let oper = Operator(rawValue: opr)!
    var numbers = [String](), operators = [String]()

    for c in expression {
        if c.isNumber || number.isEmpty {
            number += String(c)
            continue
        }

        numbers.append(number)
        operators.append(String(c))
        number.removeAll()
    }

    numbers.append(number)

    var pre = Int64(numbers.removeFirst())!

    while operators.isEmpty == false {
        let op = operators.removeFirst()
        let num = Int64(numbers.removeFirst())!

        if op == opr {
            pre = oper.calculate(pre, num)
            continue
        }

        expressions += [String(pre), op]
        pre = num
    }
    expressions.append(String(pre))

    return expressions.joined()
}

enum Operator: String {
    case multi = "*"
    case add = "+"
    case minus = "-"

    func calculate(_ lhs: Int64, _ rhs: Int64) -> Int64 {
        switch self {
            case .multi:
            return lhs * rhs
            case .add:
            return lhs + rhs
            case .minus:
            return lhs - rhs
        }
    }
}
