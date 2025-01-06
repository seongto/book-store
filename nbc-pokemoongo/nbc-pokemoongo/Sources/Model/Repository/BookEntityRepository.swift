//
//  BookEntityRepository.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 1/6/25.
//

import Foundation
import CoreData

protocol BookEntityRepository {
    func domainToEntity(book: Book, context: NSManagedObjectContext) -> BookEntity
    func entityToDomain(book: BookEntity) -> Book
    func fetchBook(by isbn: String, context: NSManagedObjectContext) -> BookEntity?
    func fetchRecentBooks(limit: Int, context: NSManagedObjectContext) -> [BookEntity]
    func updateTime(book: BookEntity, context: NSManagedObjectContext)
}


final class BookEntityRepositoryImpl: BookEntityRepository {
    // MARK: - CRUD
    
    /// 도메인 모델을 코어데이터 모델로 변경 : 새로운 책 코어 데이터 인스턴스 생성
    /// - Parameters:
    ///   - book: 코어데이터 Entity로 변환하고자 하는 도메인 모델
    ///   - context: 현재 세션
    /// - Returns: 코어데이터 BookEntity(세이브 전)
    func domainToEntity(book: Book, context: NSManagedObjectContext) -> BookEntity {
        let newBook = BookEntity(context: context)
        
        newBook.title = book.title
        newBook.authors = book.authors.joined(separator: ", ")
        newBook.isbn = book.isbn
        newBook.contents = book.contents
        newBook.datetime = book.datetime
        newBook.price = Int16(book.price)
        newBook.publisher = book.publisher
        newBook.salePrice = Int16(book.salePrice)
        newBook.status = book.status
        newBook.thumbnail = book.thumbnail
        newBook.translators = book.translators.joined(separator: ", ")
        newBook.url = book.url
        newBook.updatedAt = Date()
        
        return newBook
    }
    
    /// 특정 isbn을 가진 책 가져오기
    /// - Parameter isbn: 책의 고유한 아이디
    /// - Parameter context: 현재 세션
    /// - Returns: 일치하는 책이 있을 경우 해당 책의 entity 데이터를 가져온다.
    func fetchBook(by isbn: String, context: NSManagedObjectContext) -> BookEntity? {
        let fetchRequest: NSFetchRequest<BookEntity> = BookEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "isbn == %@", isbn as CVarArg)
        
        do {
            return try context.fetch(fetchRequest).first
        } catch {
            print("책 정보가 없습니다. : \(error)")
            return nil
        }
    }
    
    
    /// 업데이트 시간 기준 가장 최근 최대 limit개의 책 가져오기
    /// - Returns: 최대 limit개의 책 데이터
    /// - Parameters:
    ///   - limit: 가져오고자 하는 책의 최대수
    ///   - context: 현재 세션
    func fetchRecentBooks(limit: Int, context: NSManagedObjectContext) -> [BookEntity] {
        let fetchRequest: NSFetchRequest<BookEntity> = BookEntity.fetchRequest()
        
        // 최신순 정렬
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "updatedAt", ascending: false)]
        fetchRequest.fetchLimit = limit
        
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("책 데이터 가져오는 중 에러 발생 :\(error)")
            return []
        }
    }
    
    /// 마지막으로 책을 확인했을 때의 시간을 업데이트
    /// - Parameters:
    ///   - book: 수정하고자 하는 책의 entity
    ///   - context: 현재 세션
    func updateTime(book: BookEntity, context: NSManagedObjectContext) {
        book.setValue(Date(), forKey: "updatedAt")
    }
}


// MARK: - 추가 메소드

extension BookEntityRepositoryImpl {
    /// 코어데이터모델을 도메인 모델로 변경
    /// - Parameter book: 코어데이터 BookEntity
    /// - Returns: Book 도메인 모델
    func entityToDomain(book: BookEntity) -> Book {
        return Book(
            authors: book.authors?.components(separatedBy: ", ") ?? [],
            contents: book.contents ?? "",
            datetime: book.datetime ?? "",
            isbn: book.isbn ?? "",
            price: Int(book.price),
            publisher: book.publisher ?? "",
            salePrice: Int(book.salePrice),
            status: book.status ?? "",
            thumbnail: book.thumbnail ?? "",
            title: book.title ?? "",
            translators: book.translators?.components(separatedBy: ", ") ?? [],
            url: book.url ?? ""
        )
    }
}
