//
//  main.swift
//  AlogithmStudy
//
//  Created by Judy on 2022/10/18.
//

import Foundation

//MARK: - 프로그래머스 Level 0
//print(answer_PGS_점의위치구하기([2,4]))
//print(answer_PSG_치킨쿠폰(100))
//print(answer_PSG_다음에올숫자([1, 2, 3, 4]))
//print(answer_PSG_문자열밀기("hello", "ohell"))
//print(answer_PGS_특이한정렬([1, 2, 3, 4, 5, 6], 4))
//print(answer_PGS_삼각형의완성조건([1, 2]))
//print(answer_PGS_120820(1999))
//print(answer_PGS_120871(57))
//print(answer_PGS_다항식더하기("3x + 7 + x"))
//print(answer_PGS_OX퀴즈(["3 - 4 = -3", "5 + 6 = 11"]))
//print(answer_PGS_연속된수의합(5, 5))

//MARK: - 프로그래머스 Level 1
//print(answer_PGS_부족한금액계산(1000, 8000, 4))
//print(answer_PGS_내적([1, 2, 3], [4, 5, 6]))
//print(answer_PGS_콜라문제(2, 1, 20))
//print(answer_PGS_행렬의덧셈([[1, 2], [3, 4]], [[5, 6], [7, 8]]))
//print(answer_PGS_가장가까운글자("foobar"))
//print(answer_PGS_시저암호("B a y", 5))
//print(answer_PGS_햄버거만들기([2, 1, 1, 2, 3, 1, 2, 3, 1]))
//print(answer_PGS_k번째숫자([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]))
//print(answer_PGS_크기가작은부분문자열("3141592", "271"))
//print(answer_PGS_과일장수(4, 3, [4, 1, 2, 2, 4, 4, 4, 4, 1, 2, 4, 2]))
//print(answer_PGS_3진법뒤집기(45))
//print(answer_PGS_개인정보수집유효기간("2020.01.01", ["Z 3", "D 5"], ["2019.01.01 D", "2019.11.15 Z", "2019.08.02 D", "2019.07.01 D", "2018.12.28 Z"]))
//print(answer_PGS_크레인인형뽑기게임([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]))
//print(answer_PGS_비밀지도(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28]))
//print(answer_PGS_성격유형검사하기(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5]))
//print(answer_PGS_신고결과받기(["muzi", "frodo", "apeach", "neo"], ["muzi frodo", "apeach frodo", "frodo neo", "muzi neo", "apeach muzi"], 2))
//print(answer_PGS_신규아이디추천("...!@BaT#*..y.abcdefghijklm"))
//print(answer_PGS_로또의최고순위와최저순위([44, 1, 0, 0, 31, 25], [31, 10, 45, 1, 6, 19]))

//MARK: - 프로그래머스 Level 2
//print(answer_PGS_최댓값과최솟값("-1 -2 -3 -4"))
//print(answer_PGS_JadenCase문자열만들기("3people Unfollowed Me"))
//print(answer_PGS_올바른괄호("(()("))
//print(answer_PGS_캐시(5, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]))
//print(answer_PGS_괄호회전하기("}]()[{"))
//print(answer_PGS_짝지어제거하기("baabaa"))
//print(answer_PGS_오픈채팅방(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]))
//print(answer_PGS_귤고르기(6, [1, 3, 2, 5, 4, 5, 2, 3]))
//print(answer_PGS_압축("KAKAO"))
//print(answer_PGS_예상대진표(8, 4, 7))
//print(answer_PGS_n진수게임(16, 16, 2, 1))
//print(answer_PGS_위장([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]))
//print(answer_PGS_프렌즈4블록(6, 6, ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"]))
//print(answer_PGS_행렬테두리회전하기(6, 6, [[2,2,5,4],[3,3,6,6],[5,1,6,3]]))
//print(answer_PGS_이모티콘할인행사([[40, 2900], [23, 10000], [11, 5200], [5, 5900], [40, 3100], [27, 9200], [32, 6900]], [1300, 1500, 1600, 4900]))
//print(answer_PGS_최솟값만들기([1, 4, 2], [5, 4, 4]))
//print(answer_PGS_뉴스클러스터링("FRANCE", "french"))
//print(answer_PGS_카펫(10, 2))
//print(answer_PGS_파일명정렬(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"]))
//print(answer_PGS_멀리뛰기(4))
//print(answer_PGS_연속부분수열합의개수([7,9,1,1,4]))
//print(answer_PGS_튜플("{{4,2,3},{3},{2,3,4,1},{2,3}}"))
//print(answer_PGS_모음사전("EIO"))
//print(answer_PGS_점프와순간이동(5000))
//print(answer_PGS_방문길이("ULURRDLLU"))
//print(answer_PGS_피로도(80, [[80,20],[50,40],[30,10]]))
//print(answer_PGS_땅따먹기([[1,2,3,5],[5,6,7,8],[4,3,2,1]]))
//print(answer_PGS_이진변환반복하기("110010101001"))
//print(answer_PGS_다음큰숫자(78))
//print(answer_PGS_피보나치수(5))
//print(answer_PGS_프린터([1, 1, 9, 1, 1, 1], 5))
//print(answer_PGS_주차요금계산([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]))
//print(answer_PGS_k진수에서소수개수구하기(437674, 3))
//print(answer_PGS_영어끝말잇기(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]))
//print(answer_PGS_거리두기확인하기([["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]))
//print(answer_PGS_N개의최소공배수([2,6,8,14]))
//print(answer_PGS_HIndex([3, 0, 6, 1, 5]))
//print(answer_PGS_두큐합같게만들기([3, 2, 7, 2], [4, 6, 5, 1]))
//print(answer_PGS_행렬의곱셉([[2, 3, 2], [4, 2, 4], [3, 1, 4]], [[5, 4, 3], [2, 4, 1], [3, 1, 1]]))
//print(answer_PGS_n제곱배열자르기(4, 7, 14))
//print(answer_PGS_기능개발([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1]))
//print(answer_PGS_메뉴리뉴얼(["XYZ", "XWY", "WXA"], [2,3,4]))
//print(answer_PGS_타켓넘버([4, 1, 2, 1], 4))
//print(answer_PGS_문자열압축("abcabcabcabcdededededede"))
//print(answer_PGS_할인행사(["banana", "apple", "rice", "pork", "pot"], [3, 2, 2, 2, 1], ["chicken", "apple", "apple", "banana", "rice", "apple", "pork", "banana", "pork", "rice", "pot", "banana", "apple", "banana"]))
//print(answer_PGS_수식최대화("100-200*300-500+20"))
//print(answer_PGS_다리를지나는트럭(2, 10, [7, 4, 5, 6]))
//print(answer_PGS_큰수만들기("4177252841", 4))

//MARK: - 백준 BRONZE
//answer_BOJ_한다안한다_5789()
//answer_BOJ_신기한수_17618()
//answer_BOJ_문문문_17210()
//answer_BOJ_배수찾기_4504()
//answer_BOJ_파일완전삭제_9243()
//answer_BOJ_팩토리얼_7489()
//answer_BOJ_삼각형분류_9366()
//answer_BOJ_초콜릿자르기_2163()

//MARK: - 백준 SILVER
//answer_BOJ_마지막팩토리얼수_2553()


//lockAndKey([[0, 0, 0], [1, 0, 0], [0, 1, 1]], [[1, 1, 1], [1, 1, 0], [1, 0, 1]])

//print(turnRight([[0, 0, 0], [1, 0, 0], [0, 1, 1]]))

//[0, 0, 0],
//[1, 0, 0],
//[0, 1, 1]
//
//[0, 1, 0],
//[1, 0, 0],
//[1, 0, 0]
