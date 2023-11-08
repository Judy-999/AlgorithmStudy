//
//  FloorConstruction.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/10/27.
//

import Foundation

// 1 X 2, 2 X 1, 2 X 2

func floorConstruction() {
    let width = Int(readLine()!)!
    var dic = [Int: Int]()
    
    dic[1] = 1
    dic[2] = 3
    
    for num in 3..<(width + 1) {
        if let n1 = dic[num - 1], let n2 = dic[num - 2] {
            dic[num] = n1 + 2 * n2
            // 1 X 2을 추가하는 방법 + (가로 2자리를 뺀 만큼 채우는 방법) * (2 X 2를 채우는 방법)
        }
    }
    
    print(dic[width]! % 796796)
}


//for num in 3..<(width + 1) {
//    var totalCount = 0
//    for i in 1..<((num + 1) / 2) {
//        if let count1 = dic[i], let count2 = dic[num - i] {
//            totalCount += (count1 * count2)
//        }
//    }
//
//    totalCount *= 2
//    if num % 2 == 0 {
//        totalCount += 2 * (dic[num / 2] ?? 0)
//    }
//    dic[num] = totalCount
//}
