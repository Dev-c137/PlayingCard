//
//  ViewController.swift
//  PlayingCard
//
//  Created by Devang Pawar on 13/02/18.
//  Copyright © 2018 Devang Pawar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var  deck = PlayingCardDeck()
     
    @IBOutlet weak var playingCardVIew: PlayingCardView!{
        didSet{
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector (nextCard))
            swipe.direction = [.left, .right]
            playingCardVIew.addGestureRecognizer(swipe)
            let pinch = UIPinchGestureRecognizer(target: playingCardVIew, action: #selector (playingCardVIew.adjustFaceCardScale(byHandlingGestureRecognizerBy:)))
            playingCardVIew.addGestureRecognizer(pinch)
        }
    }
    
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state{
        case .ended:
            playingCardVIew.isFaceUp = !playingCardVIew.isFaceUp
        default:
            break
        }
    }
    
    
    @objc func nextCard(){
        if let card = deck.draw(){
            playingCardVIew.rank = card.rank.order
            playingCardVIew.suit = card.suit.rawValue
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


