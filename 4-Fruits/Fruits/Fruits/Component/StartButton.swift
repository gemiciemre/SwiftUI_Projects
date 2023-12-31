//
//  StartButton.swift
//  Fruits
//
//  Created by Emre Gemici on 13.07.2023.
//

import SwiftUI

struct StartButton: View {
    // MARK: - PROPERTIES
    
    @AppStorage("isOnboarding") var isOnboarding : Bool?
    
 
    
 
    
    // MARK: - BODY
    
    var body: some View {
        Button{
            isOnboarding = false
           //Some Action
        }label: {
            HStack(spacing: 8){
                Text("Start")
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }//: HSTACK
            .padding(.horizontal,16)
            .padding(.vertical,10)
            .background(
                Capsule().strokeBorder(Color.white,lineWidth: 1.25)
            )
        }
        .accentColor(Color.white)
    }
}

struct StartButton_Previews: PreviewProvider {
    static var previews: some View {
        StartButton()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
