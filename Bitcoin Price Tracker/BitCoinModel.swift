//
//  BitCoinModel.swift
//  Bitcoin Price Tracker
//
//  Created by Mayur P on 27/10/23.
//  Copyright © 2023 ZappyCode. All rights reserved.
//

import Foundation


//
//struct Results: Decodable {
//    let hits: [Post]
//}
//
//
//
//struct Post: Decodable, Identifiable {
//
//    //ID is needed to make it identifiable
//    var id : String {
//        return objectID
//    }
//    let objectID: String
//    let points: Int
//    let title: String
//    let url: String?
//    let createdAt: Date
//
//
//}


// MARK: - Results
struct Results: Decodable {
    let exhaustive: Exhaustive?
    let exhaustiveNbHits, exhaustiveTypo: Bool?
    let hits: [Hit]?
    let hitsPerPage, nbHits, nbPages, page: Int?
    let params: String?
    let processingTimeMS: Int?
    let processingTimingsMS: ProcessingTimingsMS?
    let query: String?
}

// MARK: - Exhaustive
struct Exhaustive: Codable {
    let nbHits, typo: Bool?
}

// MARK: - Hit
struct Hit: Decodable, Identifiable {
    let id = UUID()
    let highlightResult: HighlightResult?
    let tags: [String]?
    let author: String?
    let children: [Int]?
//    let createdAt: Date?
    let createdAtI, numComments: Int?
    let objectID: String?
    let points, storyID: Int?
    let title: String?
//    let updatedAt: Date?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case highlightResult = "_highlightResult"
        case tags = "_tags"
        case author, children
//        case createdAt = "created_at"
        case createdAtI = "created_at_i"
        case numComments = "num_comments"
        case objectID, points
        case storyID = "story_id"
        case title
//        case updatedAt = "updated_at"
        case url
    }
}

// MARK: - HighlightResult
struct HighlightResult: Codable {
    let author, title, url: Author?
}

// MARK: - Author
struct Author: Codable {
    let matchLevel: MatchLevel?
   
    let value: String?
}

enum MatchLevel: String, Codable {
    case none = "none"
}

// MARK: - ProcessingTimingsMS
struct ProcessingTimingsMS: Codable {
    let request: Request?

    enum CodingKeys: String, CodingKey {
        case request = "_request"
    }
}

// MARK: - Request
struct Request: Codable {
    let roundTrip: Int?
}
