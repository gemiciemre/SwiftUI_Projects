//
//  HeaderDetailView.swift
//  Touchdown
//
//  Created by Emre Gemici on 27.07.2023.
//

import SwiftUI

struct HeaderDetailView: View {
    var body: some View {
        VStack(alignment: .leading, spacing : 6, content: {
            Text("Protective Gear")
                
            Text(sampleProduct.name)
                .font(.largeTitle)
                .fontWeight(.black)
        })//: VSTACK
        .foregroundColor(.white)
    }
}

struct HeaderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
