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
    let thumbnail: [Thumbnail]              //The representative image for this character.
}

struct Thumbnail: Codable {
    let path: String                        //The directory path of to the image.,
    let `extension`: String
}
