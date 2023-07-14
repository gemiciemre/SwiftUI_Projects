//
//  FruitHeaderView.swift
//  Fruits
//
//  Created by Emre Gemici on 14.07.2023.
//

import SwiftUI

struct FruitHeaderView: View {
    // MARK: - PROPERTIES
    var fruit : Fruit
    
    // MARK: - BODY
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FruitHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FruitHeaderView(fruit: fruitsData[0])
            .previewLayout(.fixed(width: 375, height: 440))
    }
}
