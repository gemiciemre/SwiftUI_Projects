//
//  ContentView.swift
//  Learn by Doing
//
//  Created by Emre Gemici on 28.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    var cards: [Card] = cardData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center,spacing: 20) {
                ForEach(cards) { item in
                    CardView(card: item)
                }
            }
            .padding(30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cards: cardData)
    }
}
