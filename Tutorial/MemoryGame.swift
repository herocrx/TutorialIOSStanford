//
//  MemoryGame.swift
//  Tutorial
//
//  Created by Hubert Kuc on 25.08.22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent:Equatable {
    var cards : [Card]
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp == true }).oneAndOnly}
        set { cards.indices.forEach({ cards[$0].isFaceUp = $0 == newValue })}
    }
    
    var selectedCard : Card? = nil
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
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

extension Array {
    
    var oneAndOnly : Element? {
        if self.count == 1 {
            return first
        }
        else {
            return nil
        }
    }
}

