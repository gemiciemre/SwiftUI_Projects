//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by Emre Gemici on 27.07.2023.
//

import SwiftUI

struct ProductDetailView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, content:{
            // NAVBAR
            NavigationBarDetailView()
                .padding(.horizontal)
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            // HEADER
            HeaderDetailView()
                .padding(.horizontal)
            // DETAIL TOP PART
            TopBarDetailView()
                .padding(.horizontal)
            // DETAIL BOTTOM PART
            VStack(alignment: .center, spacing: 0, content: {
                // RATINGS + SIZES
                
                // DESCRIPTION
                ScrollView(.vertical,showsIndicators: false,content: {
                    Text(sampleProduct.description)
                        .font(.system(.body,design: .rounded))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                })
                // QUANTITY + FAVOURITE
                
                // ADD TO CART
                Spacer()
            })//: VSTACK
            .padding(.horizontal)
            .background(Color.white)
        })//: VSTACK
        .ignoresSafeArea(.all, edges: .all)
        .background(
            Color(
                red: sampleProduct.red,
                green: sampleProduct.green,
                blue: sampleProduct.blue
            ).ignoresSafeArea(.all,edges: .all)
        )
    }
}
    // MARK: - PREVIEW
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .previewLayout(.fixed(width: 375, height: 812))
    }
}
