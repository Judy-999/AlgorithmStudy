//
//  MakeTeam.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/11/20.
//

import Foundation

func makeTeam() {
    let teamInfo = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    var studentList = [(type: Int, teams: (Int, Int))]()
    var teamList = [Int: Int]()
    
    for _ in 0..<teamInfo[1] {
        let team = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
        studentList.append((team[0], (team[1], team[2])))
    }
    
    for i in 0..<teamInfo[0] {
        teamList[i + 1] = i + 1 // 팀를 본인으로 세팅
    }
    
    for student in studentList {
        if student.type == 0 { // 팁 합치기
            let newTeam = min(teamList[student.teams.0]!, teamList[student.teams.1]!) // 합칠 팀
            let oldTeam = max(teamList[student.teams.0]!, teamList[student.teams.1]!) // 이전 팀
            teamList.filter { $0.value == oldTeam }.forEach { (key, value) in
                teamList[key] = newTeam // 더 작은 팀으로 모두 합침
            }
        } else { // 같은 팀인지 확인
            let sameTeam = teamList[student.teams.0] == teamList[student.teams.1]
            print(sameTeam ? "Yes" : "No")
        }
    }
}


//7 8
//0 1 3
//1 1 7
//0 7 6
//1 7 1
//0 3 7
//0 4 2
//0 1 1
//1 1 1
//결과:
//No
//No
//Yes
