//
//  Video.swift
//  Wejhuh
//
//  Created by Huda N S on 28/05/1443 AH.
//

import Foundation
import SwiftUI
//
//struct Video : Decodable {
//    var videoID = ""
//    var title = ""
//    var description = ""
//    var thumbnali = ""
//    var published = ""
//    
//    enum CodingKyes : String, CodingKey{
//        case snippet
//        case thumbnails
//        case high
//        case resourceId
//        
//        case published = "publishedAt"
//        case title
//        case description
//        case thumbnali = "url"
//        case videoID = "id"
//        
//        
//    }
//    
//    init (from decoder : Decoder) throws {
//        
//        let container = try decoder.container(keyedBy: CodingKyes.self)
//        
//        
//        let snipptContainer = try container.nestedContainer(keyedBy: CodingKyes.self , forKey: .snippet)
//        
//        //parse title
//        self.title = try snipptContainer.decode(String.self , forKey: .title)
//        self.description = try snipptContainer.decode(String.self, forKey: .description)
//        self.published = try snipptContainer.decode(String.self, forKey: .published)
//        
//        let thumbnaliContainer = try snipptContainer.nestedContainer(keyedBy: CodingKyes.self, forKey: .thumbnails)
//        
//        let highContainer = try thumbnaliContainer.nestedContainer(keyedBy: CodingKyes.self, forKey: .high)
//        
//        self.thumbnali = try highContainer.decode(String.self, forKey: .thumbnali)
//        
//        let resourceIdContainer = try snipptContainer.nestedContainer(keyedBy: CodingKyes.self, forKey: .resourceId)
//        
//        self.videoID = try resourceIdContainer.decode(String.self, forKey: .videoID)
//        
//    }
//}
