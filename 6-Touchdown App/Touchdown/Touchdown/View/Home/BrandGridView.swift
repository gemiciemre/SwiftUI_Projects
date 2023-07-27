//
//  BrandGridView.swift
//  Touchdown
//
//  Created by Emre Gemici on 27.07.2023.
//

import SwiftUI

struct BrandGridView: View {
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false,content:{
            LazyHGrid(rows: gridLayout, spacing: columnSpacing, content: {
                ForEach(brands){ brand in
                    BrandItemView(brand: brand)
                }//: LOOP
            })//: GRID
            .frame(height: 200)
            .padding(10)
        })//: SCROLL
    }
}

struct BrandGridView_Previews: PreviewProvider {
    static var previews: some View {
        BrandGridView()
            .previewLayout(.sizeThatFits)
            .background(colorBackground)
    }
}
