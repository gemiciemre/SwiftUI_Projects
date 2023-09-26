//
//  HeaderComponent.swift
//  Honeymoon
//
//  Created by Emre Gemici on 25.09.2023.
//

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        VStack(alignment: .center,spacing: 20)
        {
            Capsule()
                .frame(width: 120,height: 6)
                .foregroundStyle(Color.secondary)
                .opacity(0.2)
            Image("logo-honeymoon")
                .resizable()
                .scaledToFit()
                .frame(height: 28 )
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HeaderComponent()
        .previewLayout(.fixed(width: 375, height: 128))
}
