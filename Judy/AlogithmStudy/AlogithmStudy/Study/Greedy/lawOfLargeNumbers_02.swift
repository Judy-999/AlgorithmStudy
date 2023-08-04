//
//  lawOfLargeNumbers_02.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/08/04.
//

import Foundation

func lawOfLargeNumbers_02() -> Int {
    let aa = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    let bb = readLine()!.components(separatedBy: " ").compactMap { Int($0) }.sorted(by: >)
    
    let max = bb[0]
    let secondMax = bb[1]
    let count = aa[1] / (aa[2] + 1)
    let remain = aa[1] % (aa[2] + 1)
    let result = max * count * aa[2] + secondMax * count + max * remain
    
    return result
}

// 입력:
// 5 8 3
// 2 4 5 4 6
// 결과: 46
