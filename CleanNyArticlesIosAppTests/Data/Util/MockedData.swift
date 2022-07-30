//
//  MockedData.swift
//  CleanNyArticlesIosAppTests
//
//  Created by Mithun Roy on 30/07/2022.
//

import Foundation

public final class MockedData {
    public static let dummyResponse: URL = Bundle(for: MockedData.self).url(forResource: "response", withExtension: "json")!
}

extension URL {
    /// Returns a `Data` representation of the current `URL`. Force unwrapping as it's only used for tests.
    var data: Data {
        return try! Data(contentsOf: self)
    }
}
