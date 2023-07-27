//
//  NavigationBarView.swift
//  Touchdown
//
//  Created by Emre Gemici on 26.07.2023.
//

import SwiftUI

struct NavigationBarView: View {
    
    @State private var isAnimated: Bool = false
    
    var body: some View {
        HStack{
            Button{
                // Some Action
            }label: {
                Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(.black)
            }//: BUTTON
            
            Spacer()
            
            LogoView()
                .opacity(isAnimated ? 1 : 0)
                .offset(x: 0, y:isAnimated ? 0 : -25)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 0.5)){
                        isAnimated.toggle()
                    }
                })
            
            Spacer()
            
            Button{
                // Some Action
            }label: {
                ZStack {
                    Image(systemName: "cart")
                        .font(.title)
                    .foregroundColor(.black)
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 14,height: 14)
                        .offset(x:13, y:-10 )
                }
            }//: BUTTON
            
        }//: HSTACK
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
