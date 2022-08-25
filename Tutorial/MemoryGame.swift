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
    
    struct Card { // nesting
        var isFaceUp : Bool
        var isMatched : Bool
        let content : CardContent
    }
}
