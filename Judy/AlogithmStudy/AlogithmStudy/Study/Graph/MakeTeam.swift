//
//  MakeTeam.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/11/20.
//

import Foundation

func makeTeam() {
    let teamInfo = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
    var teamList = [(type: Int, teams: (Int, Int))]()
    var superTeam = [Int: Int]()
    
    for _ in 0..<teamInfo[1] {
        let team = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
        teamList.append((team[0], (team[1], team[2])))
    }
    
    for i in 0..<teamInfo[0] {
        superTeam[i + 1] = i + 1 // 부모를 본인으로 세팅
    }
    
    for team in teamList {
        if team.type == 0 {
            let newSuper = min(superTeam[team.teams.0]!, superTeam[team.teams.1]!)
            superTeam[team.teams.0] = newSuper
            superTeam[team.teams.1] = newSuper
        } else {
            let sameTeam = superTeam[team.teams.0] == superTeam[team.teams.1]
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
