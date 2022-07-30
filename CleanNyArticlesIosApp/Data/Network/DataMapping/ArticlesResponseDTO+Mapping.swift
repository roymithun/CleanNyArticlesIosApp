//
//  ArticlesDTO.swift
//  CleanNyArticlesIosApp
//
//  Created by Mithun Roy on 29/07/2022.
//

import Foundation

struct ArticleListDTO: Decodable {
    let status: String
    let numResults: Int
    let results: [ArticlesDTO]
    
    private enum CodingKeys: String, CodingKey {
        case status
        case numResults = "num_results"
        case results
    }
}

struct ArticlesDTO: Decodable {
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
    let mediaList: [MediaDTO]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case url
        case source
        case publishedDate = "published_date"
        case updatedDate = "updated"
        case section
        case subSection = "subsection"
        case byLine = "byline"
        case title
        case abstractContent = "abstract"
        case desFacetList = "des_facet"
        case mediaList = "media"
    }
}

extension ArticlesDTO {
    func toDomain() -> Article {
        return .init(id: id,
                     url: url,
                     source: source,
                     publishedDate: publishedDate,
                     updatedDate: updatedDate,
                     section: section,
                     subSection: subSection,
                     byLine: byLine,
                     title: title,
                     abstractContent: abstractContent,
                     desFacetList: desFacetList,
                     mediaList: mediaList.map{ $0.toDomain() })
    }
}

struct MediaDTO: Decodable {
    let type: String
    let subType: String
    let caption: String
    let copyright: String
    let mediaMetadataList: [MediaMetadataDTO]
    
    private enum CodingKeys: String, CodingKey {
        case type
        case subType = "subtype"
        case caption
        case copyright
        case mediaMetadataList = "media-metadata"
    }
}

extension MediaDTO {
    func toDomain() -> Media {
        return .init(type: type,
                     subType: subType,
                     caption: caption,
                     copyright: copyright,
                     mediaMetadataList: mediaMetadataList.map{ $0.toDomain() })
    }
}

struct MediaMetadataDTO: Decodable {
    let url: String
    let format: String
    let height: Int
    let width: Int
    
    private enum CodingKeys: String, CodingKey {
        case url
        case format
        case height
        case width
    }
}

extension MediaMetadataDTO {
    func toDomain() -> MediaMetadata {
        return .init(url: url,
                     format: format,
                     height: height,
                     width: width)
    }
}
