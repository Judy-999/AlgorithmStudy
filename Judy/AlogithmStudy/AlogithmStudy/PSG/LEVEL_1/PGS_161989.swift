//
//  PGS_161989.swift
//  AlogithmStudy
//
//  Created by 김주영 on 6/13/24.
//

import Foundation

func answer_PGS_덧칠하기(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var paint = 0
    var count = 0
    
    for s in section {
        if s <= paint { continue }
        
        paint = s + (m - 1)
        count += 1
    }
    
    return count
}
