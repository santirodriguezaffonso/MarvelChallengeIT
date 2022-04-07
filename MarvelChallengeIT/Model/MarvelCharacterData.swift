//
//  MarvelData.swift
//  MarvelChallengeIT
//
//  Created by Santiago Rodriguez Affonso on 03/04/2022.
//

import Foundation


struct MarvelCharacterData: Codable {
    let data: CharacterData
}

struct CharacterData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Character]
}

struct Character: Codable {
    let id: Int                             //The unique ID of the character resource.
    let name: String                        //The name of the character.
    let description: String                 //A short bio or description of the character.
    let thumbnail: Images                   //The representative image for this character.
    let resourceURI: String
    let comics: ComicsElements
}

struct Images: Codable {
    let path: String                        //The directory path of to the image.,
    let `extension`: String
}

struct ComicsElements: Codable {
    let available: Int
    let collectionURI: String
}
