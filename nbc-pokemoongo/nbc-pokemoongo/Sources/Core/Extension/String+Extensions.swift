//
//  ISODateFormatter.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/31/24.
//

import Foundation


/// 주어진 문자열을 원하는 형태로 변경해주는 메소드 모음
extension String {
    /// 주어진 ISO8601 타입의 날짜 문자열을 한국식으로 변경해주는 메소드
    /// - Parameter isoDate: iso date 형태의 문자열
    /// - Returns: `2000년 1월 1일`과 같은 형태의 한국식 날짜로 변경.
    func isoDateToKoreanDate(_ isoDate: String) -> String{
        // ISO8601DateFormatter 생성
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withFullDate]

        // 문자열 -> Date 변환
        if let date = isoFormatter.date(from: isoDate) {
            // DateFormatter 생성
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "ko_KR") // 한국어 설정
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            
            // Date -> 사용자 친화적 문자열 변환
            return dateFormatter.string(from: date)
        } else {
            return "2000년 1월 1일"
        }
    }
}
