//
//  MemoryGame.swift
//  Tutorial
//
//  Created by Hubert Kuc on 25.08.22.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards : [Card]
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        //var chosenCard = cards[chosenIndex] // this is still getting copy!
        cards[chosenIndex].isFaceUp.toggle()
        print("chosenCard \(cards)")
    }
    
    func index(of card:Card) -> Int {
        guard let index = cards.firstIndex(where: { deckCard in
            card.id == deckCard.id
        }) else {
            return -1
        }
        return index
    }
    
    init(numberOfPairsOfCards : Int, createCardContent: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content : CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: 2*pairIndex))
            cards.append(Card(content: content, id: 2*pairIndex+1))
        }
    }
    
    struct Card : Identifiable {
        // nesting
        var isFaceUp : Bool = false
        var isMatched : Bool = false
        let content : CardContent
        var id: Int
    }
    
    
}
