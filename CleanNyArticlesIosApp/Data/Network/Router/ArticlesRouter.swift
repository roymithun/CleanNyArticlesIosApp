//
//  ArticlesRouter.swift
//  CleanNyArticlesIosApp
//
//  Created by Mithun Roy on 29/07/2022.
//

import Foundation
import Alamofire

enum ArticlesRouter {
    case articles(period: Int, apiKey: String)
    
    var baseUrl: URL {
        URL(string: "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/")!
    }
    
    var path: String {
        switch(self) {
        case let .articles(period: period, apiKey: _):
            return "all-sections/\(period).json"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .articles:
            return .get
        }
    }
    
    var paramters: [String : String] {
        switch self {
        case let .articles(period: _, apiKey: apiKey):
            return ["api-key": apiKey]
        }
    }
}

extension ArticlesRouter: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let url = baseUrl.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        request = try URLEncodedFormParameterEncoder(destination: .methodDependent).encode(paramters, into: request)
        return request
    }
}
