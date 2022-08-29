//
//  ContentView.swift
//  Tutorial
//
//  Created by Hubert Kuc on 25.08.22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game : EmojiMemoryGame
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 230))]) {
                    ForEach(game.cards) { card in
                        CardView(card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                // user intent to select the card
                                game.choose(card)
                            }
                    }
                }
            }.padding(.horizontal, 100)
    }
}

struct CardView : View {
    private let card : MemoryGame<String>.Card // tiny slice of the model
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body : some View {
        ZStack { // <--- content arguemnt to the ZStack
            let shape = RoundedRectangle(cornerRadius: Constants.roundedRectangleSize); // zstack can have the variables conditions!
            //let shape = Circle()
            if card.isFaceUp {
                shape.fill(.white).padding(25.0)
                shape.strokeBorder(lineWidth: 20).padding(25.0).foregroundColor(.red)
                Text(card.content).font(.system(size:100))
            }
            else if card.isMatched {
                shape.opacity(0.0)
            }
            else {
                shape.fill(.red).padding(25.0)
            }
        }
    }
    
    struct Constants {
        static let roundedRectangleSize : CGFloat = 25.0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game).preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game).preferredColorScheme(.light)
    }
}
