//
//  PGS_17679.swift
//  AlogithmStudy
//
//  Created by 김주영 on 2023/03/17.
//  https://school.programmers.co.kr/learn/courses/30/lessons/17679

func answer_PGS_프렌즈4블록(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var boards = board.map { $0.map { String($0) } }
    var removes = [(Int, Int)]()
    var mNum = 0, nNum = 0
    var compare = [[String]]()
    
    while boards != compare {
        compare = boards
        removes.removeAll()
        nNum = 0
        mNum = 0
        
        while nNum < n-1 {
            while mNum < m-1 {
                if boards[mNum][nNum] == boards[mNum][nNum+1] &&
                    boards[mNum][nNum] == boards[mNum+1][nNum] &&
                    boards[mNum][nNum] == boards[mNum+1][nNum+1] {
                    removes.append((mNum, nNum))
                    removes.append((mNum, nNum+1))
                    removes.append((mNum+1, nNum))
                    removes.append((mNum+1, nNum+1))
                }
                mNum += 1
            }
            mNum = 0
            nNum += 1
        }
        
        for (m, n) in removes {
            boards[m][n] = "0"
        }
        
        nNum = 0
        mNum = m-1
        
        while mNum >= 0 {
            while nNum < n {
                if boards[mNum][nNum] == "0" {
                    var row = mNum
                    while row >= 0 {
                        if boards[row][nNum] != "0" {
                            let tmp = boards[row][nNum]
                            boards[row][nNum] = "0"
                            boards[mNum][nNum] = tmp
                            break
                        }
                        row -= 1
                    }
                }
                nNum += 1
            }
            mNum -= 1
            nNum = 0
        }
    }
    
    return boards.flatMap { $0 }.filter { $0 == "0" }.count
}
