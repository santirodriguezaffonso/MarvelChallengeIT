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
    let results: [Character]
}

struct Character: Codable {
    let id: Int                             //The unique ID of the character resource.
    let name: String                        //The name of the character.
    let description: String                 //A short bio or description of the character.
    let urls: [URLElements1]                //A set of public web site URLs for the resource.
    let thumbnail: [Thumbnail1]                  //The representative image for this character.
}

struct URLElements1: Codable {
    let type: String
    let url: String
}

struct Thumbnail1: Codable {
    let path: String                        //The directory path of to the image.,
    let thumbnailExtension: String
}
