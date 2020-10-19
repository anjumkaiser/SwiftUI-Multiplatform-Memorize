//
//  MemoryGame.swift
//  Memorize
//
//  Created by Muhammad Anjum Kaiser on 27/08/2020.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var indexOfTheOnlyFaceUpCard: Int?
    
    mutating func choose(card: Card) {
        print("card chosen \(card)")
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isCardMatched {
            if let potentialMatchIndex = indexOfTheOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[indexOfTheOnlyFaceUpCard!].content {
                    cards[chosenIndex].isCardMatched = true
                    cards[potentialMatchIndex].isCardMatched = true
                }
                indexOfTheOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp = true
        }
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return -1 // TODO: bogus!
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards  = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let cardcontent = cardContentFactory(pairIndex)
            cards.append(Card(content: cardcontent, id: pairIndex*2))
            cards.append(Card(content: cardcontent, id: pairIndex*2+1))
        }
        
        cards.shuffle() // shuffle cards
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isCardMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
