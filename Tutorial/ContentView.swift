//
//  ContentView.swift
//  Tutorial
//
//  Created by Hubert Kuc on 25.08.22.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🏎","🚕","🚙","🚖", "🚴‍♀️", "🚓", "✈️", "🚘", "🛩", "🚤", "🚢"]
    @State var emojiCount = 10
        
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 230))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji, isFaceUp: true).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
                Spacer()

            }.padding(.horizontal, 100)
        }
    }
}

struct CardView : View {
    let content : String
    @State var isFaceUp : Bool // any let in the struct cannot change, it is not a boolean but it is a POINTER to the boolean!!!!!!
    // temporary state, in the middle of the drag
    // the ui is constanty rebuilt!
    // logic decided how it should look like!
    
    
    var body : some View {
        ZStack { // <--- content arguemnt to the ZStack
            let shape = RoundedRectangle(cornerRadius: Constants.roundedRectangleSize); // zstack can have the variables conditions!
            //let shape = Circle()
            if isFaceUp {
                shape.fill(.white).padding(25.0)
                shape.strokeBorder(lineWidth: 20).padding(25.0).foregroundColor(.red)
                Text(content).font(.system(size:100))
            }
            else {
                shape.fill(.red).padding(25.0)
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
    
    struct Constants {
        static let roundedRectangleSize : CGFloat = 25.0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
