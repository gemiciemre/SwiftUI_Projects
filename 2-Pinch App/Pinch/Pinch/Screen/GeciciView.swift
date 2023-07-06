//
//  GeciciView.swift
//  Pinch
//
//  Created by Emre Gemici on 6.07.2023.
//

import SwiftUI

struct GeciciView: View {
    @State private var isExpanded = false

    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.title)
                .padding()

            if isExpanded {
                Text("This is an expanded view.")
                    .font(.subheadline)
                    .padding()
            }

            Button("Toggle") {
                withAnimation {
                    isExpanded.toggle()
                }
            }
        }
    }
}

struct GeciciView_Previews: PreviewProvider {
    static var previews: some View {
        GeciciView()
    }
}
