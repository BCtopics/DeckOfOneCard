//
//  Card.swift
//  DeckOfOneCard
//
//  Created by Bradley GIlmore on 6/5/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation

class Card {
    
    //MARK: - Keys
    
    private let valueKey = "value"
    private let suitKey = "suit"
    private let imageEndPointKey = "image"
    
    //MARK: - Initializers
    
    init(value: String, suit: String, imageEndPoint: String) {
        self.value = value
        self.suit = suit
        self.imageEndPoint = imageEndPoint
    }
    
    init?(dictionary: [String: Any]) {
        
        guard let value = dictionary[valueKey] as? String,
        let suit = dictionary[suitKey] as? String,
            let imageEndPoint = dictionary[imageEndPointKey] as? String else { return nil }
        
        self.value = value
        self.suit = suit
        self.imageEndPoint = imageEndPoint
        
    }
    
    //MARK: - Internal Properties
    let value: String
    let suit: String
    let imageEndPoint: String
    
}
