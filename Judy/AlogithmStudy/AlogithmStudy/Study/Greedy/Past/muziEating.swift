//
//  muziEating.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/08/11.
//

import Foundation

//func solution(_ food_times:[Int], _ k:Int64) -> Int {
//    var foods = food_times
//    var count = Int(k)
//    var index = 0
//    var min = 0
//
//    if foods.filter { $0 != 0 }.isEmpty { return -1 }
//
//    min = foods.filter { $0 != 0 }.min()!
//
//    while true {
//        if min <= count {
//            foods = foods.map {
//                if $0 != 0 {
//                    return $0 - min
//                } else { return $0 } }
//            count -= min
//            print("\(count) / m: \(min)")
//         } else { break }
//        if foods.filter { $0 != 0 }.isEmpty { break }
//        min = foods.filter { $0 != 0 }.min()!
//    }
//
//    while foods.filter { $0 != 0 }.isEmpty == false {
//        if foods[index] > 0 {
//            if count == 0 {
//                break
//            }
//            foods[index] -= 1
//            count -= 1
//        }
//
//        index += 1
//        if index == foods.count {
//            index = 0
//        }
//    }
//
//    return count == 0 && !(foods.filter { $0 != 0 }.isEmpty) ? index + 1 : -1
//}

func solution(_ food_times:[Int], _ k:Int64) -> Int {
    var foods = food_times
    var count = k
    var index = 0

    while foods.filter({ $0 != 0 }).isEmpty == false {
        if foods[index] > 0 {
            if count == 0 {
                break
            }
            foods[index] -= 1
            count -= 1
        }

        index += 1
        if index == foods.count {
            index = 0
        }
    }

    return count == 0 && !(foods.filter { $0 != 0 }.isEmpty) ? index + 1 : -1
}

//func muziEating(_ food_times:[Int], _ k:Int64) -> Int {
//    var foods = food_times
//    var count = k
//    var result = -1
//
//    while count > 0 && !(foods.filter { $0 != 0 }.isEmpty) {
//        foods = foods.enumerated().map { index, value in
//            if value > 0 && count >= 0 {
//                if count == 0 { result = index + 1 }
//                count -= 1
//                return value - 1
//            } else { return value }
//        }
//    }
//
//    if count >= 0 && foods.filter { $0 != 0 }.isEmpty || result == -1 {
//        return -1
//    }
//
//    return result
//}


func muzi() {
//    if
    
}
