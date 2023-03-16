//
//  PGS_12985.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/16.
//  https://school.programmers.co.kr/learn/courses/30/lessons/12985

func answer_PGS_예상대진표(_ n: Int, _ a: Int, _ b: Int) -> Int {
    var count = 1
    var aNum = a, bNum = b
    
    while true {
        if abs(aNum - bNum) == 1 &&  (aNum / 2 != bNum / 2) {
           break
        }
        aNum = (aNum + 1) / 2
        bNum = (bNum + 1) / 2
    
        count += 1
    }

    return count
}
