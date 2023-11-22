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
    var timeList = [Int: Int]()
    
    lectureList.enumerated().forEach { (index, lecture) in
        timeList[index] = lecture.time // 자기 자신은 무조건 수강해야 하니 초기화
    }
    
    let start = countList.firstIndex(of: 0) ?? 0
    var indexList: [Int] = [start]
    
    while indexList.isEmpty == false {
        let now = indexList.removeFirst()
        countList[now] = -1 // 큐에서 뺀다는 의미로 -1로 대체
        
        for (i, lecture) in lectureList.enumerated() {
            if lecture.list.contains(now + 1) { // 해당 과목을 선수로 가지면 (과목이 1부터 시작해서 +1) // timeList : 여태 쌓아온 시간
                timeList[i] = max(timeList[i]!, timeList[now]! + lectureList[i].time) // lectureList[i[.time: i 과목의 수강 시간
                // 현재까지 필요하다는 시간 vs 선수 과목 시간 + 이 과목이 필요한 시간
                // 3번(40) 여태 필요하다고 하는 총 시간 (= 이게 지금 20 + 40인 상태) vs 1번(30)를 수강하는데 필요한 총 시간 + 3번(40)의 수강 시간
                // 여기서 더 큰 값을 3번의 총 시간으로 대체 (= 30 + 40)
                // 3번을 들으려면 1, 2번를 들어야 함 -> 1, 2는 동시 수강하자! 그럼 더 오래 걸리는 시간으로 결정
                countList[i] -= 1 // 필요한 과목 수 빼기
            }
        }
        
        countList.enumerated().forEach { (key, value) in
            if value == 0, !indexList.contains(key) { // 남은 선수 과목이 0이된 과목들
                indexList.append(key)
            }
        }
    }
    
    print(timeList.sorted(by: { $0.key < $1.key }).map { $0.value })
}

//5
//10 -1
//10 1 -1
//4 1 -1
//4 3 1 -1
//3 3 -1
//
//10 20 14 18 17
