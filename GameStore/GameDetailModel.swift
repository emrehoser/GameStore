//
//  GameDetailModel.swift
//  GameStore
//
//  Created by Hamza IŞIKTAŞ on 18.03.2021.
//

import Foundation
import ObjectMapper

class GameDetailModel: Mappable {

    var gameId: Int?
    var gameName: String?
    var backgroundImage: String?
    var description: String?
    var website: String?
    var reddit: String?
    var metacritic: Int?
    var genres: [Genre]?
    
    func mapping(map: Map) {
        gameId <- map["id"]
        gameName <- map["name"]
        description <- map["description_raw"]
        backgroundImage <- map["background_image"]
        website <- map["website"]
        reddit <- map["reddit_url"]
        metacritic <- map["metacritic"]
        genres <- map["genres"]
    }
    
    required init(map: Map) {
        
    }
    
    
}

