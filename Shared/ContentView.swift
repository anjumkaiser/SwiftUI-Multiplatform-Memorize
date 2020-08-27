//
//  ContentView.swift
//  Shared
//
//  Created by Muhammad Anjum Kaiser on 25/08/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            ForEach(0..<4) { vindex in
                HStack {
                    ForEach(0..<4) { index in
                        CardView(isFacedUp: false)
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
    var isFacedUp: Bool
    
    var body: some View {
        if isFacedUp {
            ZStack {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text("👻")
            }
        } else {
            RoundedRectangle(cornerRadius: 10.0).fill()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
