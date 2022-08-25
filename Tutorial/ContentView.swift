//
//  ContentView.swift
//  Tutorial
//
//  Created by Hubert Kuc on 25.08.22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel : EmojiMemoryGame
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 230))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                // user intent to select the card
                                viewModel.choose(card)
                            }
                    }
                }
            }.padding(.horizontal, 100)
    }
}

struct CardView : View {
    let card : MemoryGame<String>.Card // tiny slice of the model
    
    var body : some View {
        ZStack { // <--- content arguemnt to the ZStack
            let shape = RoundedRectangle(cornerRadius: Constants.roundedRectangleSize); // zstack can have the variables conditions!
            //let shape = Circle()
            if card.isFaceUp {
                shape.fill(.white).padding(25.0)
                shape.strokeBorder(lineWidth: 20).padding(25.0).foregroundColor(.red)
                Text(card.content).font(.system(size:100))
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
        ContentView(viewModel: game).preferredColorScheme(.dark)
        ContentView(viewModel: game).preferredColorScheme(.light)
    }
}
