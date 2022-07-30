//
//  MostPopularArticlesRepositoryTest.swift
//  CleanNyArticlesIosAppTests
//
//  Created by Mithun Roy on 30/07/2022.
//

import XCTest
import Alamofire
import Mocker

class MostPopularArticlesRepositoryTest: XCTestCase {
    
    override func setUp() {
        let originalURL = URL(string: "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=apiKey")
            
        let mockedData = MockedData.dummyResponse.data
        let mock = Mock(url: originalURL!,
                        dataType: .json,
                        statusCode: 200,
                        // Data containing the JSON response
                        data: [.get : mockedData])
        mock.register()
    }
    
    func testUrl() throws {
        
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self]  + (configuration.protocolClasses ?? [])
        let sessionManager = Alamofire.Session(configuration: configuration)
        
//        let articleRepository = MostPopularArticlesRepository(sessionManager)


        // given
        let expectation = self.expectation(description: "get articles fetched result")
        expectation.expectedFulfillmentCount = 1
        
        // when
        var articles = [Article]()
//        articleRepository.getArticles(period: 7, apiKey: "apikey") { result in
//            articles = (try? result.get()) ?? []
//            expectation.fulfill()
//        }
        sessionManager.request(ArticlesRouter.articles(period: 7, apiKey: "apiKey"))
            .validate()
            .responseDecodable(of: ArticleListDTO.self) { response in
                guard let articleList = response.value else {
                    return
                }
                XCTAssertNil(response.error)
                articles = articleList.results.map { $0.toDomain() }
                expectation.fulfill()
            }
        
        // then
        waitForExpectations(timeout: 20, handler: nil)
        XCTAssertEqual(articles.count, 20)
    }
}
