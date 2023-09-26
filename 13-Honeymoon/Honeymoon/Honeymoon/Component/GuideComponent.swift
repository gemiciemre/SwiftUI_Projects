//
//  GuideComponent.swift
//  Honeymoon
//
//  Created by Emre Gemici on 25.09.2023.
//

import SwiftUI

struct GuideComponent: View {
    // MARK: - PROPERTIES
    var title: String
    var subtitle: String
    var description: String
    var icon: String
    
    
    var body: some View {
        HStack{
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundStyle(Color.pink)
            VStack{
                HStack{
                    Text(title.uppercased())
                        .font(.title)
                        .fontWeight(.heavy)
                    Spacer()
                    Text(subtitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.pink)
                }
                Divider().padding(.bottom,4)
                Text(description)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    GuideComponent(
        title: "Title",
        subtitle: "Swipe Right",
        description: "This placeholder sentence. This placeholder sentence. This placeholder sentence. This placeholder sentence.",
        icon: "heart.circle")
        .previewLayout(.sizeThatFits)
}
 
