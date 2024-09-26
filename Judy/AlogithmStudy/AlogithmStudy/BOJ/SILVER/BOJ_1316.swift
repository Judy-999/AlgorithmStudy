//
//  BOJ_1316.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/26/24.
//

import Foundation

func answer_BOJ_그룹단어체커_1316() {
    let wordCount = Int(readLine()!)!
    let words = (0..<wordCount).map { _ in readLine()! }
    var notCount = 0
    
    for word in words {
        var list: [Character] = []
        
        for w in word {
            if list.isEmpty {
                list.append(w)
                continue
            }
            
            if let last = list.last {
                if last == w {
                    continue
                } else if !list.contains(w) {
                    list.append(w)
                } else {
                    notCount += 1
                    break
                }
            }
        }
    }
    
    print(wordCount - notCount)
}

//happy 
//new
//year

// 각 단어가 그룹단어인지 = +1
// 현재 알파벳이 이어서가 아닌 다음에 나오면 X
