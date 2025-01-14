//
//  DataFetcher.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/31/24.
//

import UIKit
import Alamofire


struct DataFetcher {
    static func fetchByAlamo<T: Decodable>(url: URL, completion: @escaping (Result<T, AFError>) -> Void) {
        AF.request(url).responseDecodable(of: T.self) { response in
            completion(response.result)
        }
    }
    
    static func fetchImageByAlamo(url: URL, completion: @escaping (Result<Data, AFError>) -> Void) {
        AF.request(url).responseData { response in
            completion(response.result)
        }
    }
}
