//
//  FruitDetailView.swift
//  Fruits
//
//  Created by Emre Gemici on 13.07.2023.
//

import SwiftUI

struct FruitDetailView: View {
    // MARK: - PROPERTIES
    
    var fruit : Fruit
    
    // MARK: - BODY
    var body: some View {
        NavigationView{
            ScrollView(.vertical,showsIndicators: false){
                VStack(alignment: .center,spacing: 20){
                    VStack(alignment: .leading,spacing: 20){
                        // TITLE
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(fruit.gradientColors[1])
                        // HEADLINE
                        
                        // NUTRIENTS
                        
                        // SUBHEADLINE
                        
                        // DESCRIPTION
                        
                        // LINK
                        
                        
                    }//: VSTACK
                    .padding(.horizontal,20)
                    .frame(maxWidth:640,alignment:.center)
                }//: VSTACK
            }//: SCROLL VIEW
        }//:NAVIGATION
    }
}

struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitsData[0])
    }
}
