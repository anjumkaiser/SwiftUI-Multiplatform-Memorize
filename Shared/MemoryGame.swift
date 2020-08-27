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
            cards.append(Card(content: cardcontent, id: pairIndex*2))
            cards.append(Card(content: cardcontent, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isCardMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
