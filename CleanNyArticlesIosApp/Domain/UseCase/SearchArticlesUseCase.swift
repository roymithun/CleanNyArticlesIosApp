//
//  SearchArticlesUseCase.swift
//  CleanNyArticlesIosApp
//
//  Created by Mithun Roy on 29/07/2022.
//

import Foundation

protocol SearchArticlesUseCase {
    func execute(param: SearchParam,
                 completion: @escaping (Result<[Article], Error>) -> Void) -> Cancellable?
}

class SearchMostPopularArticlesUseCase: SearchArticlesUseCase {
    private let articlesRepository: AriclesRepository
    
    init(articlesRepository: AriclesRepository) {
        self.articlesRepository = articlesRepository
    }
    
    func execute(param: SearchParam,
                 completion: @escaping (Result<[Article], Error>) -> Void) -> Cancellable? {
        return articlesRepository.searchArticles(query: param.query, completion: { result in
            completion(result)
        })
    }
}

struct SearchParam {
    let query: String
}
