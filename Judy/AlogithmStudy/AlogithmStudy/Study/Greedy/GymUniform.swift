//
//  GymUniform.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/08/20.
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int { // 3
    let chance = [0, -1, 2]
    let chance1 = [0, 1, -2]

    return n - min(check(chance, lost, reserve), check(chance1, lost, reserve))
}

func check(_ chance: [Int], _ lost: [Int], _ reserve: [Int]) -> Int {
    var losts = lost
    var reserves = reserve
    for c in chance {
        reserves = reserves.map { $0 + c }
        let intersection = Set(losts).intersection(reserves)
        losts = losts.filter { !intersection.contains($0) }
        reserves = reserves.filter { !intersection.contains($0) }
    }
    
    return losts.count
}



//func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
//    var arr = lost.filter{ !reserve.contains($0) }.sorted()
//    var student = reserve.filter { !lost.contains($0) }.sorted()
//    for i in student {
//        if arr.contains(i-1) {
//            arr.remove(at: arr.firstIndex(of: i-1)!)
//        } else if arr.contains(i+1) {
//            arr.remove(at: arr.firstIndex(of: i+1)!)
//        }
//    }
//    return n - arr.count
//}
