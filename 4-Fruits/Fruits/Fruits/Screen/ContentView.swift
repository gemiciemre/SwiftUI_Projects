//
//  ContentView.swift
//  Fruits
//
//  Created by Emre Gemici on 12.07.2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    var fruits: [Fruit] = fruitsData
    
    // MARK: - BODY
    var body: some View {
        NavigationView{
            List{
                ForEach(fruits.shuffled()) { item in // .shuffled() method
                    NavigationLink(destination: FruitDetailView(fruit: item)){
                        FruitRowView(fruit: item)
                            .padding(.vertical,4)
                    }
                }
            }//: LIST
            .navigationTitle("Fruits")
        }//: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
            
    }
}
