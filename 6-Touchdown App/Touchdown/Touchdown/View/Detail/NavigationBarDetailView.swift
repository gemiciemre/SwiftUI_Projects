//
//  NavigationBarDetailView.swift
//  Touchdown
//
//  Created by Emre Gemici on 27.07.2023.
//

import SwiftUI

struct NavigationBarDetailView: View {
    
    @EnvironmentObject var shop : Shop
    
    var body: some View {
        HStack{
            Button{
                withAnimation(.easeIn){
                    feedback.impactOccurred()
                    shop.selectedProduct = nil
                    shop.showingProduct = false
                }
            }label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.white)
            }
            Spacer()
            Button{
                // Some Action
            }label: {
                Image(systemName: "cart")
                    .font(.title)
                    .foregroundColor(.white)
            }
        } //: HSTACK
    }
}

struct NavigationBarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarDetailView()
            .environmentObject(Shop()) //EnvironmentObject modifier ını kullanmamız gerekiyor.
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
