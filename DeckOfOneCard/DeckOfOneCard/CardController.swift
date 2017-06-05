//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by Bradley GIlmore on 6/5/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation

class CardController {
    
    static let baseURL = "http://deckofcardsapi.com/api/deck/new/draw/"
    
    enum HTTPMethod: String {
        case Get = "GET"
        case Put = "PUT"
        case Post = "POST"
        case Patch = "PATCH"
        case Delete = "DELETE"
    }
    
    static func draw(numberOfCards: Int, completion: @escaping ([Card]) -> Void) {
        
        let urplParameters = ["count": "\(numberOfCards)"]
        
        guard let baseURL = URL(string: self.baseURL) else { return }
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        components?.queryItems = urplParameters.flatMap { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let fullURL = components?.url else { return }
        
        var request = URLRequest(url: fullURL)
        
        request.httpMethod = HTTPMethod.Get.rawValue
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
         
            if let error = error { print(error.localizedDescription) }
            
            guard let data = data, let responseDataString = String(data: data, encoding: .utf8) else {
                NSLog("Data Error, no data returned from datatask")
                return
                }
            
            guard let responseDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any] else { NSLog("Error during JSONSerialization \(responseDataString)"); return }
            
         
            guard let cardDictionaries = responseDictionary["cards"] as? [[String: Any]] else { return }
            
            let cards = cardDictionaries.flatMap { Card(dictionary: $0) }
            
            // Parse the json, and initialize a card from it. 
            
            completion(cards)
        }
        
        dataTask.resume()
        
    }
    
    
    
}
