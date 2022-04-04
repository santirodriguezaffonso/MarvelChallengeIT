//
//  MarvelManager.swift
//  MarvelChallengeIT
//
//  Created by Santiago Rodriguez Affonso on 03/04/2022.
//

import Foundation
import CryptoKit

protocol MarvelManagerDelegate {
    func didUpdateCharacter(_ marvelManager: MarvelManager, character: CharacterModel)
    func didUpdateEvent(_ marvelManager: MarvelManager, event: EventsModel)
    func didFailWithError(error: Error)
}

struct MarvelManager {
    
    var delegate: MarvelManagerDelegate?
    
    let publickKey = "6683e7721dbfb9be6fe7eab995a7a085"
    let privateKey = "5a6f7c01f90e6583b63da37ef511ff4603c68c80"
    
    func MD5(data: String) -> String {
        
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        return hash.map {
            String(format: "%02hhx", $0)
        }
        .joined()
    }
    
    func searchCaracter() {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(data: "\(ts)")
        let urlString = "https://gateway.marvel.com:443/v1/public/characters?ts=\(ts)&apikey=\(publickKey)&hash=\(hash)"
        performRequest1(with: urlString)
    }
    
    
    func performRequest1(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let character = parseJSON(marvelCharacterData: safeData) {
                        delegate?.didUpdateCharacter(self, character: character)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(marvelCharacterData: Data) -> CharacterModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(MarvelCharacterData.self, from: marvelCharacterData)
            let id = decodedData.data.results[0].id
            let name = decodedData.data.results[0].name
            let description = decodedData.data.results[0].description
            let image = decodedData.data.results[0].thumbnail[0].path
            
            
            let character = CharacterModel(id: id, characterName: name, description: description, image: image)
            return character
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
//// MARK: Event JSON
//
//    func searchEvent() {
//        let ts = String(Date().timeIntervalSince1970)
//        let hash = MD5(data: "\(ts)\(privateKey)\(publickKey)")
//        let urlString = "https://gateway.marvel.com:443/v1/public/events?ts=\(ts)&apikey=\(publickKey)&hash=\(hash)"
//        performRequest2(with: urlString)
//    }
//
//    func performRequest2(with urlString: String) {
//        if let url = URL(string: urlString) {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { data, response, error in
//                if error != nil {
//                    delegate?.didFailWithError(error: error!)
//                    return
//                }
//                if let safeData = data {
//                    if let event = parseJSON(marvelEventData: safeData) {
//                        delegate?.didUpdateEvent(self, event: event)
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
//
//    func parseJSON(marvelEventData: Data) -> EventsModel? {
//        let decoder = JSONDecoder()
//        do {
//            let decodedData = try decoder.decode(MarvelEventsData.self, from: marvelEventData)
//            let id = decodedData.data.results[0].id
//            let name = decodedData.data.results[0].title
//            let description = decodedData.data.results[0].description
//            let image = decodedData.data.results[0].thumbnail
//
//
//            let event = EventsModel(id: id, eventName: name, description: description, image: image)
//            return event
//        } catch {
//            delegate?.didFailWithError(error: error)
//            return nil
//        }
//    }
}
