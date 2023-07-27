//
//  TopBarDetailView.swift
//  Touchdown
//
//  Created by Emre Gemici on 27.07.2023.
//

import SwiftUI

struct TopBarDetailView: View {
    
    @State private var isAnimating : Bool = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 6, content: {
            // PRICE
            VStack(alignment: .leading, spacing: 6, content: {
                Text("Price")
                    .fontWeight(.semibold)
                
                Text(sampleProduct.formattedPrice)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .scaleEffect(1.35,anchor: .leading)
            })//: VSTACK
            .offset(y: isAnimating ? -50 : -75) // Animasyonun nerden nereye olacağı konusunda koordinat
            Spacer()
            
            //PHOTO
            Image(sampleProduct.image)
                .resizable()
                .scaledToFit()
                .offset(y: isAnimating ? 0 : -35)
        })//: HSTACK
        .onAppear(perform: {
            withAnimation(.easeOut(duration: 0.75)){
                isAnimating.toggle()
            }
        })
    }
}

struct TopBarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TopBarDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
