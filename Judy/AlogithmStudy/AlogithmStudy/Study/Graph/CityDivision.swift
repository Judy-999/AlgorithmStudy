//
//  CityDivision.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/11/22.
//

import Foundation

func cityDivision() {
    let cityInfo = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    var cityList = [(road: (Int, Int), charge: Int)]()
    var union = [Int: Int]()
    var totalCahrge = 0
    
    for _ in 0..<cityInfo[1] {
        let city = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
        cityList.append(((city[0], city[1]), city[2]))
    }
    
    for i in 0..<cityInfo[0] {
        union[i + 1] = i + 1 // 집단을 자기 자신으로 세팅
    }
    
    cityList.sort(by: { $0.charge > $1.charge }) // 비용이 가장 큰 순으로 정렬
    
    while let cityRoad = cityList.popLast() {
        if let start = union[cityRoad.road.0],
           let end = union[cityRoad.road.1] {
            if start != end { // 같은 집단이 아니라면
                totalCahrge += cityRoad.charge
                // 같은 집답을 갖게 만들기 (최소 값을 가진 집단)
                let newUnion = min(start, end)
                let changeUnion = max(start, end)
                union.filter { $0.value == changeUnion }.forEach { (key, value) in
                    union[key] = newUnion
                }
            } else { // 같은 그룹이라면 추가하지 않고 그냥 넘어감
                continue
            }
        }
        
        if Set(union.map { $0.value }).count == 1 {
            // 최소 신장 트리가 완성됐으면 (= 모두 같은 집단이면)
            totalCahrge -= cityRoad.charge
            // 두 개의 신장 트리를 최소 비용으로 만드려면 최소 신장 트리에서 가장 큰 비용인 거리를 빼면 됨
            // 비용이 작은 순으로 했으므로 가장 마지막에 추가한 비용이 가장 큰 값
            break
        }
    }
    
    print(totalCahrge)
}


//7 12
//1 2 3
//1 3 2
//3 2 1
//2 5 2
//3 4 4
//7 3 6
//5 1 5
//1 6 2
//6 4 1
//6 5 3
//4 5 3
//6 7 4

// 결과: 8
