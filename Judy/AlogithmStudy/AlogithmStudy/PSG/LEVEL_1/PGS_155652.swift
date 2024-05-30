//
//  PGS_155652.swift
//  AlogithmStudy
//
//  Created by 김주영 on 5/30/24.
//

import Foundation

func answer_PGS_둘만의암호(_ s:String, _ skip:String, _ index:Int) -> String {
        // 최대로 알파벳을 빼도 가능한 숫자만큼 이어붙이기
    var alphavet: String = String(repeating: "abcdefghijklmnopqrstuvwxyz", count: 3)
    var result: String = ""

    alphavet = alphavet.filter { !skip.contains(String($0)) } // skip에 속한 알파벳 제거
    
    s.forEach {
        if let currentIndex = alphavet.firstIndex(of: $0) { // 바꿀 알파벳 위치 찾기
            let changedIndex = alphavet.index(currentIndex, offsetBy: index) // index만큼 뒤의 위치 찾기
            result += String(alphavet[changedIndex]) // 찾은 위치의 알파벳 넣기
        }
    }

    return result
}

// 처음에 두 번만 반복해서 잘못됨
// replacing...으로 했는데 그냥 filter로 하면 됨
// +3
