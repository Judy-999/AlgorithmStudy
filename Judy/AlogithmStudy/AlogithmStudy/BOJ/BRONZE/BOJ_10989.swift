//
//  BOJ_10989.swift
//  AlogithmStudy
//
//  Created by 김주영 on 9/20/24.
//

import Foundation

func answer_BOJ_수정렬하기3_10989() { // 숫자의 최대가 10000으로 반복 횟수와 메모리가 충분함 => Count Sort
    let number = Int(readLine()!) ?? 0
    var count = [Int](repeating: 0, count: 10000 + 1)
    
    for _ in 0..<number {
        count[Int(readLine()!)!] += 1 // 입력도 따로 받지 않고 입력과 동시에 넣으면 시간과 메모리 절약 가능
    }
    
    var sortedArray = ""
    print(count)
    for (number, frequency) in count.enumerated() {
        sortedArray += String(repeating: String(number) + "\n", count: frequency)
        // 굳이 배열로 넣었다가 다시 문자열로 바꿀 필요 없이 바로 문자열로 만들기
        // 두 번 변환하지 않고 한 번에 출력 가능
        // Swift는 입력, 출력이 느린 편
    }

    print(sortedArray)
}

// MARK: - 계수정렬 시간 초과
//func answer_BOJ_수정렬하기3_10989() {
//    let number = Int(readLine()!) ?? 0
//    let numbers: [Int] = (0..<number).compactMap { _ in Int(readLine()!) }
//    var countArray = [Int](repeating: 0, count: 10001)
//    var sortedArray = [Int](repeating: 0, count: number)
//    
//    for num in numbers {
//        countArray[num] += 1
//    }
//    
//    for i in 1..<countArray.count {
//        countArray[i] += countArray[i - 1]
//    }
//    
//    for num in numbers.reversed() {
//        countArray[num] -= 1
//        sortedArray[countArray[num]] = num
//    }
//
//    print(sortedArray.map { String($0) }.joined(separator: "\n"))
//}


// MARK: - 기수정렬 메모리 초과
//func answer_BOJ_수정렬하기3_10989() {
//    let number = Int(readLine()!) ?? 0
//    var numbers: [Int] = (0..<number).compactMap { _ in Int(readLine()!) }
//    let radix = 10
//    let max = 4
//    var bucket: [[Int]] = Array(repeating: [], count: radix)
//    var digit = 1
//    
//    (0..<max).forEach { _ in
//        for n in numbers {
//            bucket[(n / digit) % 10].append(n)
//        }
//        
//        numbers = bucket.flatMap { $0 }
//        bucket = Array(repeating: [], count: radix)
//        digit *= 10
//    }
//    
//    print(numbers.map { String($0) }.joined(separator: "\n"))
//}


// MARK: - 퀵정렬 시간 초과
//func answer_BOJ_수정렬하기3_10989() {
//    let number = Int(readLine()!) ?? 0
//    var numbers: [Int] = (0..<number).compactMap { _ in Int(readLine()!) }
//    
//    quickSort(left: 0, right: number - 1)
//    
//    func quickSort(left: Int, right: Int) {
//        guard left < right else { return }
//        
//        var i = left
//        var j = right
//        let pivotIndex = (i + j) / 2
//        let pivot = numbers[pivotIndex]
//        
//        while i <= j {
//            while numbers[i] < pivot {
//                i += 1
//            }
//            
//            while numbers[j] > pivot {
//                j -= 1
//            }
//            
//            if i <= j {
//                numbers.swapAt(i, j)
//                i += 1
//                j -= 1
//            }
//        }
//        
//        quickSort(left: left, right: j)
//        quickSort(left: i, right: right)
//    }
//    
//    print(numbers.map { String($0) }.joined(separator: "\n"))
//}
