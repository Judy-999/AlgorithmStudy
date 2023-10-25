//
//  FindPart.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/10/25.
//

import Foundation

func findPart() {
    let _ = Int(readLine()!)!
    let inventory = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    var _ = Int(readLine()!)!
    let find = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    var result = [String]()
    
    for i in find {
        inventory.contains(i) ? result.append("yes") : result.append("no")
    }
    
    print(result.joined(separator: " "))
}
