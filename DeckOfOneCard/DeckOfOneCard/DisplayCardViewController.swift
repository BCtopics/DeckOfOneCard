//
//  DisplayCardViewController.swift
//  DeckOfOneCard
//
//  Created by Bradley GIlmore on 6/5/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class DisplayCardViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var cardImageView: UIImageView!

    //MARK: - IBActions
    
    @IBAction func drawButtonTapped(_ sender: Any) {
        
        CardController.draw(numberOfCards: 1) { (cards) in
            
            guard let card = cards.first else { return }
            
            ImageController.image(forURL: card.imageEndPoint, completion: { (image) in
                guard let image = image else { return }
                
                self.cardImageView.image = image
                
            })
            
        }
        
    }
    
    
}
