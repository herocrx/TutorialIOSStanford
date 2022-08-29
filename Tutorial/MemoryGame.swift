//
//  MemoryGame.swift
//  Tutorial
//
//  Created by Hubert Kuc on 25.08.22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent:Equatable {
    var cards : [Card]
    
    var selectedCard : Card? = nil
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = index(of: card), !card.isMatched, !card.isFaceUp {
            if let sCard = selectedCard {
                if sCard.content == cards[chosenIndex].content {
                    cards[chosenIndex].isMatched = true;
                    cards[index(of: sCard)!].isMatched = true;
                }
                selectedCard = nil
            }
            else {
                selectedCard = card
                for aCard in cards {
                    cards[index(of: aCard)!].isFaceUp = false
                }
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        
        print("\(cards)")
    }
    
    func index(of card:Card) -> Int? {
        cards.firstIndex {$0.id == card.id}
    }
    
    
    init(numberOfPairsOfCards : Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content : CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: 2*pairIndex))
            cards.append(Card(content: content, id: 2*pairIndex+1))
        }
    }
    
    struct Card : Identifiable {
        // nesting
        var isFaceUp = false
        var isMatched = false
        let content : CardContent
        let id: Int
    }
    
    
}
