//
//  MapAnnotionView.swift
//  Africa
//
//  Created by Emre Gemici on 24.07.2023.
//

import SwiftUI

struct MapAnnotionView: View {
    
    var location : NationalParkLocation
    @State private var animation : Double = 0.0
    
    var body: some View {
        ZStack{
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54,height: 54,alignment: .center)
            Circle()
                .stroke(Color.accentColor,lineWidth: 2)
                .frame(width: 52,height: 52, alignment: .center)
                .scaleEffect(0.8 + CGFloat(animation))
                .opacity(1 - animation)
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48,height: 48, alignment: .center)
                .clipShape(Circle())
        }//: ZSTACK
        .onAppear{
            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1
            }
        }
    }
}

struct MapAnnotionView_Previews: PreviewProvider {
    
    static var locations : [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    static var previews: some View {
        MapAnnotionView(location: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
