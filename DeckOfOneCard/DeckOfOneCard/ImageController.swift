//
//  ImageController.swift
//  DeckOfOneCard
//
//  Created by Bradley GIlmore on 6/5/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    
    static func image(forURL url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else {
            print("URL optional is nil")
            
            DispatchQueue.main.async {
                completion(nil)
            }
            return
        }
        
        NetworkController.performRequest(for: url, httpMethod: .get) { (data, error) in
            
            guard let data = data,
                let image = UIImage(data: data) else {
                    print("No data")
                    
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                    return
            }
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
}
