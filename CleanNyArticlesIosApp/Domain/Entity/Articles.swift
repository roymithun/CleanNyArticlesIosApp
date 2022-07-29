//
//  Articles.swift
//  CleanNyArticlesIosApp
//
//  Created by Mithun Roy on 28/07/2022.
//

import Foundation

protocol Model: Equatable {
}

struct MediaMetadata: Model {
    let url: String
    let format: String
    let height: Int
    let width: Int
}

struct Media: Model {
    let type: String
    let subType: String
    let caption: String
    let copyright: String
    let mediaMetadataList: [MediaMetadata]
}

struct Article: Model {
    let id: Int64
    let url: String
    let source: String
    let publishedDate: String
    let updatedDate: String
    let section: String
    let subSection: String
    let byLine: String
    let title: String
    let abstractContent: String
    let desFacetList: [String]
    let mediaList: [Media]
}
