//
//  BookNetworkManager.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/31/24.
//

import Foundation
import RxSwift
import Alamofire


class BookNetworkManager {
    static let shared = BookNetworkManager()
    
    private let apiKey = ProcessInfo.processInfo.environment["KAKAO_KEY"] ?? ""
    
    func fetchBooks(query: String, page: Int = 1) -> Observable<[Book]> {
        let url = "https://dapi.kakao.com/v3/search/book"
        
        // Authorization 헤더 설정
        let headers: HTTPHeaders = [
            "Authorization": "KakaoAK \(apiKey)"
        ]
        
        let parameters: Parameters = [
            "query": query,
            "page": page,
            "size": 10
        ]
        
        return Observable.create { observer in
            AF.request(url, method: .get, parameters: parameters, headers: headers)
                .validate()
                .responseDecodable(of: BookAPIResponse.self) { response in
                    switch response.result {
                    case .success(let data):
                        observer.onNext(data.documents)
                        observer.onCompleted()
                    case .failure(let error):
                        print("Error! : \(error)")
                        observer.onError(error)
                    }
                }
            return Disposables.create()
        }
    }
}
