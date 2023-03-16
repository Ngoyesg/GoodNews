//
//  WebService.swift
//  GoodNews
//
//  Created by Natalia Goyes on 3/03/23.
//

import Foundation

class WebService {
    
    func getArticles(url: URL, completion: @escaping ([Article])-> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
              
                let headlines = try? JSONDecoder().decode(Headlines.self, from: data)
                
                if let headlines = headlines {
                    completion(headlines.articles)
                    print(headlines.articles)
                }
                
            }
            
            
        }.resume()
        
        
    }
    
}
