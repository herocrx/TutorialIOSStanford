//
//  EmojiMemoryGame.swift
//  Tutorial
//
//  Created by Hubert Kuc on 25.08.22.
//

import SwiftUI

// ViewModel is always class!
// intermediary


// ObservableObject publishes!
class EmojiMemoryGame : ObservableObject {
    
    //type variable!!
    //type function!!
    private static let emojis = ["🏎","🚕","🚙","🚖", "🚴‍♀️", "🚓", "✈️", "🚘", "🛩", "🚤", "🚢"]
    
    @Published private(set) var model = MemoryGame<String>(numberOfPairsOfCards: 5) { pairIndex in emojis[pairIndex] } // gatekeeper only the view model itself can see the model because 'private'

    var cards : Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card : MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    // Be careful
    // you can use the static within the class func but it needs to be scoped!
    //    func foo() {
    //        let obj = EmojiMemoryGame.emojis;
    //    }
    
}
