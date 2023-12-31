//
//  ContentView.swift
//  Avocados
//
//  Created by Emre Gemici on 31.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @State private var currentPage = 0
    
    var headers: [Header] = headersData
    var facts: [Fact] = factsData
    var recipes: [Recipe] = recipesData
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 20){
                // MARK: - HEADER
                /*
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(alignment: .top,spacing: 0){
                        ForEach(headers) { item in
                            HeaderView(header: item)
                                
                        }
                    }
                }
                */
                TabView{
                    ForEach(headers) { item in
                        HeaderView(header: item)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(width: 480,height: 320)
                
                // MARK: - DISHES VIEW
                Text("Avocado Dishes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                DishesView()
                    .frame(width: 410)
                
                // MARK: - AVOCADO FACTS
                
                Text("Avocado Facts")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(alignment: .top, spacing: 60){
                        ForEach(facts) { item in
                           FactsView(fact: item)
                                .padding(.vertical)
                                .padding(.leading, 60)
                                .padding(.trailing, 20)
                        }
                    }
                }
                .padding(.horizontal,25)
                // MARK: - RECIPE CARDS
                
                Text("Avocado Recipes")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                VStack(alignment:.center, spacing: 20){
                    ForEach(recipes) { item in
                        RecipeCardView(recipe: item)
                    }
                }
                .frame(maxWidth: 640)
                .padding(.horizontal,35)

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
                .padding(.horizontal,35)
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
        ContentView(headers: headersData,facts: factsData,recipes: recipesData)
    }
}
