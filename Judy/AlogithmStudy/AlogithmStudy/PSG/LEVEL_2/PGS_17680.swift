//
//  PGS_17680.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/13.
//  https://school.programmers.co.kr/learn/courses/30/lessons/17680

import Foundation

func answer_PGS_캐시(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache = [String]()
    var result = 0
    
    if cacheSize == 0 {
        return cities.count * 5
    }
    
    for city in cities {
        let target = city.lowercased()
        
        if let index = cache.firstIndex(of: target) {
            result += 1
            cache.remove(at: index)
            cache.append(target)
            continue
        }
        
        if cache.count >= cacheSize {
            cache.remove(at: 0)
        }
        
        result += 5
        cache.append(target)
    }
    
    return result
}
