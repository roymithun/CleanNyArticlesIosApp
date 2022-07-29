//
//  SearchArticlesUseCaseTests.swift
//  CleanNyArticlesIosAppTests
//
//  Created by Mithun Roy on 29/07/2022.
//

import XCTest

class SearchArticlesUseCaseTests: XCTestCase {
    func testSearchArticlesUseCase_whenSuccessfullyFetchesArticles_thenFetchedResultContainsCorrectValue() throws {
        // given
        let expectation = self.expectation(description: "search articles fetched result")
        expectation.expectedFulfillmentCount = 1
        
        let searchMostPopularArticlesUseCase = SearchMostPopularArticlesUseCase(
            articlesRepository: FakeArticlesRepository(result:.success(articles))
        )
        
        // when
        var fetchedArticles = [Article]()
        let param = SearchParam(query: "")
        _ = searchMostPopularArticlesUseCase.execute(param: param) {result in
            fetchedArticles = (try? result.get()) ?? []
            expectation.fulfill()
        }
        // then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(fetchedArticles.contains(articles[1]))
    }
}
