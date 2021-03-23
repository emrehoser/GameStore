//
//  GamesModel.swift
//  GameStore
//
//  Created by Hamza IŞIKTAŞ on 18.03.2021.
//

import Foundation
import ObjectMapper

class GamesModel: Mappable {

    var games: [Game] = []
    
    func mapping(map: Map) {
        games  <- map["results"]
    }
    
    required init(map: Map) {
        
    }
    
    
}

class Game: Mappable {
    
    var gameId: Int?
    var gameName: String?
    var backgroundImage: String?
    var metacritic: Int?
    var genres: [Genre]?
    
    func mapping(map: Map) {
        gameId <- map["id"]
        gameName <- map["name"]
        backgroundImage <- map["background_image"]
        metacritic    <- map["metacritic"]
        genres <- map["genres"]
    }
    
    required init(map: Map) {
        
    }
    
}

public class Genre: NSObject, Mappable {
    
    var name: String?

    public func mapping(map: Map) {
        name     <- map["name"]
        
    }

    required public init(map: Map) {
        
    }
}
