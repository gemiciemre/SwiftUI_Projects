//
//  ContentView.swift
//  Avocados
//
//  Created by Emre Gemici on 31.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentPage = 0
    
    var headers: [Header] = headersData
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 20){
                // MARK: - HEADER
                
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(alignment: .top,spacing: 0){
                        ForEach(headers) { item in
                            HeaderView(header: item)
                                
                        }
                    }
                }
                
                // MARK: - DISHES VIEW
                Text("Avocado Dishes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                DishesView()

                // MARK: - FOOTER
                VStack(alignment: .center, spacing: 20){
                    Text("All About Avocados")
                        .font(.system(.title, design: .serif))
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    Text("Everything you wanted to know about avocados but were too afraid to ask.")
                        .font(.system(.body, design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.gray)
                        .frame(minHeight: 60)
                }
                .frame(maxWidth: 640)
                .padding()
                .padding(.bottom,85)
            }//: VSTACK
        }//: SCROLL
        .edgesIgnoringSafeArea(.all)
        .padding(0)
    }
}

struct TitleModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.system(.title,design: .serif))
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(headers: headersData)
    }
}
