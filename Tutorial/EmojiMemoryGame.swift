//
//  EmojiMemoryGame.swift
//  Tutorial
//
//  Created by Hubert Kuc on 25.08.22.
//

import SwiftUI

// ViewModel is always class!
// intermediary

class EmojiMemoryGame {
    
    //type variable!!
    //type function!!
    private static let emojis = ["🏎","🚕","🚙","🚖", "🚴‍♀️", "🚓", "✈️", "🚘", "🛩", "🚤", "🚢"]
    
    private(set) var model = MemoryGame<String>(numberOfPairsOfCards: 3) { pairIndex in emojis[pairIndex] } // gatekeeper only the view model itself can see the model because 'private'

    var cards : Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // Be careful
    // you can use the static within the class func but it needs to be scoped!
    //    func foo() {
    //        let obj = EmojiMemoryGame.emojis;
    //    }
    
}
