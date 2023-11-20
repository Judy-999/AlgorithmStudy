//
//  Curriculum.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/11/19.
//

import Foundation

func curriculum() {
    let number = Int(readLine()!)!
    var lectureList = [(time: Int, list: [Int])]()
    
    for _ in 0..<number {
        let lecture = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
        let list = lecture.count > 2 ? Array(lecture[1..<(lecture.count - 1)]) : []
        lectureList.append((lecture[0], list))
    }
    
    var countList = lectureList.map { $0.list.count } // 강의 별 필요한 선수 과목 수
    var result = [Int: Int]()
    
    lectureList.enumerated().forEach { (index, lecture) in
        result[index] = lecture.time
    }
    
    let start = countList.firstIndex(of: 0) ?? 0
    var indexList: [Int] = [start]
    
    while indexList.isEmpty == false {
        let index = indexList.removeFirst()
        countList[index] = -1 // 큐에서 뺀다는 의미로 -1로 대체
        
        for (i, lecture) in lectureList.enumerated() {
            if lecture.list.contains(index + 1) { // 과목이 1부터 시작해서 +1, 해당 과목을 선수로 가지면
                result[i] = max(result[i]!, result[index]! + lectureList[i].time)
                // 현재 필요하다는 시간 vs 선수 과목이 필요한 시간 + 선수 과목 시간
                countList[i] -= 1
            }
        }
        
        countList.enumerated().forEach { (i, v) in
            if v == 0, !indexList.contains(i) { // 남은 선수 과먹이 0이된 과목들
                indexList.append(i)
            }
        }
    }
    
    print(result.sorted(by: { $0.key < $1.key }).map { $0.value })
}


//10 -1
//10 1 -1
//4 1 -1
//4 3 1 -1
//3 3 -1
//
//10 20 14 18 17
