//
//  FakeData.swift
//  CleanNyArticlesIosAppTests
//
//  Created by Mithun Roy on 29/07/2022.
//

import Foundation

struct FakeArticlesRepository: AriclesRepository {
    var result: Result<[Article], Error>
    
    func getArticles(period: Int, apiKey: String, completion: (Result<[Article], Error>) -> Void) -> Cancellable? {
        completion(result)
        return nil
    }
    
    func searchArticles(query: String, completion: (Result<[Article], Error>) -> Void) -> Cancellable? {
        completion(result)
        return nil
    }

}

let articles: [Article] = {
    return [
        Article(id: 100000007779268,
                url: "https://www.nytimes.com/2021/07/04/sports/basketball/espn-rachel-nichols-maria-taylor.html",
                source: "New York Times",
                publishedDate: "2021-07-04",
                updatedDate: "2021-07-06 13:15:32",
                section: "Sports",
                subSection: "N.B.A.",
                byLine: "By Kevin Draper",
                title: "A Disparaging Video Prompts Explosive Fallout Within ESPN",
                abstractContent: "“People adored Ivana.”",
                desFacetList: [
                    "Television",
                    "Black People"
                ],
                mediaList: [
                    Media(
                        type: "image",
                        subType: "photo",
                        caption: "Maria Taylor, at left front, considered refusing to appear on ESPN’s “NBA Countdown” along with her costars, from left, Jalen Rose, Adrian Wojnarowski and Jay Williams. Rachel Nichols, right, was heard on a video making disparaging comments about Taylor. Jimmy Pitaro, center, ESPN’s president, has tried to smooth over the relationships.",
                        copyright: "Eleanor Shakespeare",
                        mediaMetadataList: [
                            MediaMetadata(
                                url: "https://static01.nyt.com/images/2021/07/01/sports/espn-illustration/espn-illustration-thumbStandard.jpg",
                                format: "Standard Thumbnail",
                                height: 75,
                                width: 75
                            )
                        ]
                    )
                ]
            ),
        Article(id: 100000007838438,
                url: "https://www.nytimes.com/2021/07/04/sports/basketball/espn-rachel-nichols-maria-taylor.html",
                source: "New York Times",
                publishedDate: "2021-07-01",
                updatedDate: "2021-07-02 10:24:00",
                section: "Sports",
                subSection: "N.B.A.",
                byLine: "By Ben Protess, William K. Rashbaum and Jonah E. Bromwich",
                title: "Largest Study to Date Shows How Covid Vaccines Affect Periods",
                abstractContent: "For some, a side effect of getting vaccinated was a change in menstrual cycles — but experts say there is no cause for alarm.",
                desFacetList: [
                    "Tax Evasion",
                    "United States Politics and Government"
                ],
                mediaList: [
                    Media(
                        type: "image",
                        subType: "photo",
                        caption: "Maria Taylor, at left front, considered refusing to appear on ESPN’s “NBA Countdown” along with her costars, from left, Jalen Rose, Adrian Wojnarowski and Jay Williams. Rachel Nichols, right, was heard on a video making disparaging comments about Taylor. Jimmy Pitaro, center, ESPN’s president, has tried to smooth over the relationships.",
                        copyright: "Eleanor Shakespeare",
                        mediaMetadataList: [
                            MediaMetadata(
                                url: "https://static01.nyt.com/images/2021/07/01/sports/espn-illustration/espn-illustration-thumbStandard.jpg",
                                format: "Standard Thumbnail",
                                height: 75,
                                width: 75
                            )
                        ]
                    )
                ]
            )
    ]
}()
