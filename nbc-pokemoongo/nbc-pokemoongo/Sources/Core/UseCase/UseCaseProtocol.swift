//
//  UseCaseProtocol.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 1/6/25.
//

import Foundation

protocol UseCaseProtocol {
    associatedtype Input
    associatedtype Output
    
    func execute(_ input: Input) -> Output
}
