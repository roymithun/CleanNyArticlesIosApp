//
//  ArticlesRepository.swift
//  CleanNyArticlesIosApp
//
//  Created by Mithun Roy on 28/07/2022.
//

import Foundation

protocol AriclesRepository {
    @discardableResult
    func getArticles(period: Int, apiKey: String, completion: @escaping (Result<[Article], Error>) -> Void) -> Cancellable?
    
    @discardableResult
    func searchArticles(query: String, completion: @escaping (Result<[Article], Error>) -> Void) -> Cancellable?
}
