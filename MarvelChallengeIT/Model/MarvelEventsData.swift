//
//  MarvelEventsData.swift
//  MarvelChallengeIT
//
//  Created by Santiago Rodriguez Affonso on 03/04/2022.
//

import Foundation

struct MarvelEventsData: Codable {
    let data: EventData
}

struct EventData: Codable {
    let results: [Event]
}

struct Event: Codable {
    let id: String
    let title: String
    let description: String
    let urls: [URLElements2]
    let thumbnail: [Thumbnail2]
}

struct URLElements2: Codable {
    let type: String
    let url: String
}

struct Thumbnail2: Codable {
    let path: String
    let thumbnailExtension: String
}
