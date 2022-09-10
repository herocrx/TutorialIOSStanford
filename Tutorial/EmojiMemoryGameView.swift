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
                        CardView(card: card)
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
    let card : MemoryGame<String>.Card // tiny slice of the model
    
    var body : some View {
        GeometryReader(content: { geometry in
            let minLength = min(geometry.size.width, geometry.size.height)
            ZStack { // <--- content arguemnt to the ZStack
                let shape = RoundedRectangle(cornerRadius: Constants.roundedRectangleSize); // zstack can have the variables conditions!
                //let shape = Circle()
                if card.isFaceUp {
                    shape.fill(.white).padding(Constants.shapePadding)
                    shape.strokeBorder(lineWidth: Constants.strokeLineBorder).padding(Constants.shapePadding).foregroundColor(.red)
                    Text(card.content).font(.system(size:minLength * 0.85))
                }
                else if card.isMatched {
                    shape.opacity(0.0)
                }
                else {
                    shape.fill(.red).padding(Constants.shapePadding)
                }
            }
        })
     }

    struct Constants {
        static let strokeLineBorder = 20.0
        static let shapePadding = 25.0
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
