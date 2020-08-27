//
//  EmojiMemoryGameView.swift
//  Shared
//
//  Created by Muhammad Anjum Kaiser on 25/08/2020.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        
        VStack {
            ForEach(0..<4) { vindex in
                HStack {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card).onTapGesture {
                            viewModel.choose(card: card)
                        }
                    }
                }
            }
        }
        
        .padding()
        .foregroundColor(.orange)
        .font(Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        if card.isFaceUp {
            ZStack {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            }
        } else {
            RoundedRectangle(cornerRadius: 10.0).fill()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
