//
//  RecentBooksUseCase.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 1/6/25.
//

import Foundation

protocol RecentBooksUseCase {
    func execute() -> Result<[Book], Error>
}

/// 최근에 본 책 목록을 가져오는 메소드
/// - execute(_:) : 사용자 로그인을 실행하는 메서드
struct RecentBooksUseCaseImpl: RecentBooksUseCase {
    private let bookEntityRepository: BookEntityRepository
    
    init(bookEntityRepository: BookEntityRepository) {
        self.bookEntityRepository = bookEntityRepository
    }
    
    /// limit로 지정된 숫자 만큼의 가장 최근 업데이트 된 BookEntity 를 구하는 메소드
    /// - Returns: 성공적으로 사용자 로그인이 완료되면 `BookEntity`의 배열을 반환합니다.
    func execute() -> Result<[Book], Error> {
        let context = CoreDataStack.shared.context
        let result = bookEntityRepository.fetchRecentBooks(limit: 10, context: context)
        let recentBooks = result.map { bookEntityRepository.entityToDomain(book: $0) }
        
        return .success(recentBooks)
    }
}
