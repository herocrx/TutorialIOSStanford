//
//  MemoryGame.swift
//  Tutorial
//
//  Created by Hubert Kuc on 25.08.22.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards : [Card]
    
    func choose(_ card: Card)
    {
        
    }
    
    init(numberOfPairsOfCards : Int, createCardContent: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content : CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card { // nesting
        var isFaceUp : Bool = false
        var isMatched : Bool = false
        let content : CardContent
    }
}
