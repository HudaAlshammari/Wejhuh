//
//  Response.swift
//  Wejhuh
//
//  Created by Huda N S on 28/05/1443 AH.
//

import Foundation

struct Response : Decodable {
    
    var items:[Item]?
    
    enum CodingKyes:String, CodingKey {
        case items
    }
    
    init (from decoder : Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKyes.self)
        self.items = try container.decode([Item].self , forKey: .items)
    }
}
