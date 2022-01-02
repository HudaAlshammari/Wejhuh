//
//  Model.swift
//  Wejhuh
//
//  Created by Huda N S on 28/05/1443 AH.
//

import Foundation


protocol ModelDelegate {
    func videosFetched(_ videos:[Item])
}



class Model {
    
    var delegate : ModelDelegate?
    
    
    func gitVideos(){
        let url = URL(string: Constents.API_URL)
        guard url != nil else{
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data , response , error) in
            
            
            if error != nil || data == nil {
                print(error)
                return
            }
            do {
                
                print(String(data: data!, encoding: .utf8) ?? "")
                
                let  decoder = JSONDecoder()
                decoder.dataDecodingStrategy = .base64
                
                let response = try decoder.decode(VideoResponse.self, from: data!)
                
                if response.items != nil {
                    
                    DispatchQueue.main.async {
                        self.delegate?.videosFetched(response.items)
                    }
                    
                }
                
               // dump(response)
            }
            catch {
                print(error)
            }
            
    }
    
        dataTask.resume()
}
}
