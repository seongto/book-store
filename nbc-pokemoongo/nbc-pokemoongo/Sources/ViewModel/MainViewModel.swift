//
//  MainViewModel.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 1/6/25.
//

import RxSwift
import RxCocoa
import Differentiator


struct BookSection {
    enum SectionType {
        case recent
        case searchResult
    }
    
    let type: SectionType
    var items: [Book]
    var header: String
}

extension BookSection: SectionModelType {
    typealias Item = Book
    
    init(original: BookSection, items: [Book]) {
        self = original
        self.items = items
    }
}

class MainViewModel {
    // MARK: - Properties
    
    private let bookNetworkManager = BookNetworkManager.shared
    private let disposeBag = DisposeBag()
    private let recentBooksUseCase: RecentBooksUseCase
    
    // Relay를 두 개로 나누어 각 섹션을 개별 관리
    private let recentBooksRelay = BehaviorRelay<[Book]>(value: [])
    private let searchResultsRelay = BehaviorRelay<[Book]>(value: [])
    
    // 전체 섹션 데이터를 바인딩할 Relay
    let bookSectionsRelay: BehaviorRelay<[BookSection]> = BehaviorRelay(value: [])
    
    
    // MARK: - Life Cycles
    
    init() {
        self.recentBooksUseCase = AppContainer.shared.resolve(RecentBooksUseCase.self)!
        
        // 두 개의 Relay를 합쳐 bookSectionsRelay로 바인딩
        Observable.combineLatest(recentBooksRelay, searchResultsRelay)
            .map { recentBooks, searchResults in
                return [
                    BookSection(
                        type: .recent,
                        items: recentBooks,
                        header: "Recent Books"
                    ),
                    BookSection(
                        type: .searchResult,
                        items: searchResults,
                        header: "Search Results"
                    )
                ]
            }
            .bind(to: bookSectionsRelay)
            .disposed(by: disposeBag)
    }
}

// MARK: - View Update

extension MainViewModel {
    func fetchBooks(query: String) {
        // 검색 결과 섹션 업데이트
        bookNetworkManager.fetchBooks(query: query)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] books in
                self?.searchResultsRelay.accept(books)
            })
            .disposed(by: disposeBag)
    }
    
    func refreshRecentBooks() {
        let result = recentBooksUseCase.execute()
        
        switch result {
        case .success(let recentBooks):
            self.recentBooksRelay.accept(recentBooks)
            
        case .failure:
            let alertView = AlertView(title: "최근 책 정보 가져오기 실패", message: "잠시 후 다시 시도해주세요.")
            let _ = ModalManager.createBottomSlideModal(content: alertView)
        }
        
        
    }
}
