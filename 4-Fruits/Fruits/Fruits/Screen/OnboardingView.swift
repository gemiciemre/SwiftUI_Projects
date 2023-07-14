//
//  OnboardingView.swift
//  Fruits
//
//  Created by Emre Gemici on 13.07.2023.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    
    var fruits : [Fruit] = fruitsData
    
    // MARK: - BODY
    var body: some View {
        TabView{
            ForEach(fruits[1...5]) { item in
                CardView(fruit: item)
            }//: LOOP
        }//: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical,20)
        
        
    }
}
    // MARK: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
