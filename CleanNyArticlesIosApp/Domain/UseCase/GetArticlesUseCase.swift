//
//  GetMostPopularArticlesUseCase.swift
//  CleanNyArticlesIosApp
//
//  Created by Mithun Roy on 29/07/2022.
//

import Foundation

protocol GetArticlesUseCase {
    func execute(param: GetArticlesParam,
                 completion: @escaping (Result<[Article], Error>) -> Void) -> Cancellable?

}

class GetMostPopularArticlesUseCase: GetArticlesUseCase {
    private let articlesRepository: AriclesRepository
    
    init(articlesRepository: AriclesRepository) {
        self.articlesRepository = articlesRepository
    }
    
    func execute(param: GetArticlesParam, completion: @escaping (Result<[Article], Error>) -> Void) -> Cancellable? {
        return articlesRepository.getArticles(period: param.period, apiKey: param.apiKey, completion: { result in
            // TODO - save to db
            completion(result)
        })
    }
    
    
}

struct GetArticlesParam {
    let period: Int
    let apiKey: String
}
