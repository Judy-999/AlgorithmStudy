//
//  chickenStreet.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/09/18.
//

import Foundation

func chickenStreet() {
    let numbers = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    var streets = [[Int]]()
    var chickens = [(Int, Int)]()
    var houses = [(Int, Int)]()
    var chickenDistances = [Int]()
    
    // 배열 만들어주기
    for _ in 0..<numbers[0] {
        let street = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
        streets.append(street)
    }
    
    // 집과 치킨집 위치를 각각 배열로 분리
    for (row, places) in streets.enumerated() {
        for (column, place) in places.enumerated() {
            if place == 1 {
                houses.append((row, column))
            } else if place == 2 {
                chickens.append((row, column))
            }
        }
    }
    
    let selectedChickens = combination(chickens, n: numbers[1])
    
    for chickens in selectedChickens {
        chickenDistances.append(calculateDistance(houses, chickens)) // 치킨거리 추가
    }
    
    print(chickenDistances.min()!)
}

func calculateDistance(_ houses: [(Int, Int)], _ chickens: [(Int, Int)]) -> Int {
    var chickenDistances = [Int]()
    
    for house in houses {
        var distances = [Int]()
        for chicken in chickens {
            let distance = abs(chicken.0 - house.0) + abs(chicken.1 - house.1)
            distances.append(distance)
        }
        
        chickenDistances.append(distances.min()!)
    }
    
    return chickenDistances.reduce(0, +)
}

func combination(_ array: [(Int, Int)], n: Int) -> [[(Int, Int)]] {
    var combinations = [[(Int, Int)]]()
    func dfs(index: Int, result: [(Int, (Int))]) {
        if result.count == n {
            combinations.append(result)
            return
        }
        
        for i in index..<array.count {
            dfs(index: i + 1, result: result + [array[i]])
        }
    }
    
    dfs(index: 0, result: [])
    return combinations
}


//5 3
//[0 0 1 0 0]
//[0 0 2 0 1]
//[0 1 2 0 0]
//[0 0 1 0 0]
//[0 0 0 0 2]
