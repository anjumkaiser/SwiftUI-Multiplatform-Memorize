//
//  MemoryGame.swift
//  Memorize
//
//  Created by Muhammad Anjum Kaiser on 27/08/2020.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card chosen \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards  = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let cardcontent = cardContentFactory(pairIndex)
            cards.append(Card(isFaceUp: false, isCardMatched: false, content: cardcontent))
            cards.append(Card(isFaceUp: false, isCardMatched: false, content: cardcontent))
        }
    }
    
    struct Card {
        var isFaceUp: Bool
        var isCardMatched: Bool
        var content: CardContent
    }
}
