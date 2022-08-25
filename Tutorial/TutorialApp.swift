//
//  TutorialApp.swift
//  Tutorial
//
//  Created by Hubert Kuc on 25.08.22.
//

import SwiftUI

@main
struct TutorialApp: App {
    let game : EmojiMemoryGame = EmojiMemoryGame() // it can be a let because it is a class
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
