//
//  GetMostPopularArticlesUseCaseTests.swift
//  CleanNyArticlesIosAppTests
//
//  Created by Mithun Roy on 29/07/2022.
//

import XCTest

class GetArticlesUseCaseTests: XCTestCase {
    func testGetArticlesUseCase_whenSuccessfullyFetchesArticles_thenFetchedResultContainsCorrectValue() throws {
        // given
        let expectation = self.expectation(description: "get articles fetched result")
        expectation.expectedFulfillmentCount = 1
        
        let getMostPopularArticlesUseCase = GetMostPopularArticlesUseCase(
            articlesRepository: FakeArticlesRepository(result:.success(articles))
        )
        
        // when
        var fetchedArticles = [Article]()
        let param = GetArticlesParam(period: 7, apiKey: "dummykey")
        _ = getMostPopularArticlesUseCase.execute(param: param) {result in
            fetchedArticles = (try? result.get()) ?? []
            expectation.fulfill()
        }
        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(fetchedArticles.contains(articles[1]))
    }

}
