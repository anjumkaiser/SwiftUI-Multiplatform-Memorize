//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Muhammad Anjum Kaiser on 27/08/2020.
//

import Foundation
import SwiftUI


class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    
    // MARK: - Intents
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    
    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
