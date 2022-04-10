//
//  MarvelEventsData.swift
//  MarvelChallengeIT
//
//  Created by Santiago Rodriguez Affonso on 03/04/2022.
//

import Foundation

struct MarvelEventsData: Codable {
    let `data`: EventData
}

struct EventData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Event]
}

struct Event: Codable {
    let id: Int
    let title: String
    let description: String
    let resourceURI: String
    let urls: [UrlElements]
    let start: String?
    let end: String?
    let thumbnail: [EventImages]
}

struct UrlElements: Codable {
    let type: String
    let url: String
}

struct EventImages: Codable {
    let path: String
    let `extension`: String
}
