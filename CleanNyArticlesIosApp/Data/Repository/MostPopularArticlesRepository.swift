//
//  MostPopularArticlesRepository.swift
//  CleanNyArticlesIosApp
//
//  Created by Mithun Roy on 29/07/2022.
//

import Foundation
import Alamofire

struct MostPopularArticlesRepository {
    let alamofireSession: Alamofire.Session
    init(_ alamofireSession: Alamofire.Session) {
        self.alamofireSession = alamofireSession
    }
}

extension MostPopularArticlesRepository: AriclesRepository {
   func getArticles(period: Int, apiKey: String, completion: @escaping (Result<[Article], Error>) -> Void) -> Cancellable? {
        alamofireSession.request(ArticlesRouter.articles(period: period, apiKey: apiKey))
            .validate()
            .responseDecodable(of: ArticleListDTO.self) { response in
                guard let articleList = response.value else {
                    completion(.failure(response.error!))
                    return
                }
                completion(.success(articleList.results.map { $0.toDomain() }))
            }
        return nil
    }
    
    func searchArticles(query: String, completion: @escaping (Result<[Article], Error>) -> Void) -> Cancellable? {
        // TODO
        return nil
    }
}
