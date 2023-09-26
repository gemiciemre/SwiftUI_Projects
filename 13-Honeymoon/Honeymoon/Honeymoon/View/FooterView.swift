//
//  FooterView.swift
//  Honeymoon
//
//  Created by Emre Gemici on 25.09.2023.
//

import SwiftUI

struct FooterView: View {
    
    @Binding var showBookingAlert: Bool
    
    let haptics = UINotificationFeedbackGenerator()
    
    var body: some View {
        HStack{
            Button(action: {
                //Some Action
            }, label: {
                Image(systemName: "xmark.circle")
                    .font(.system(size: 42,weight: .light))
            })
            .tint(Color.red)
            Spacer()
            Button(action: {
                //Some Action
                playSound(sound: "sound-click", type: "typ3")
                self.haptics.notificationOccurred(.success)
                self.showBookingAlert.toggle()
                
            }, label: {
                Text("Book Destination".uppercased())
                    .font(.system(.subheadline,design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal,20)
                    .padding(.vertical,12)
                    .tint(Color.pink )
                    .background(
                        Capsule().stroke(Color.pink, lineWidth: 2 )
                    )
            })
            Spacer()
            
            Button(action: {
                //Some Action
            }, label: {
                Image(systemName: "heart.circle")
                    .font(.system(size: 42,weight: .light))
            })
            .tint(Color.green)
        }
        .padding()
    }
}

#Preview(traits:.sizeThatFitsLayout){
    
    @State var showAlert:Bool = false
    
    return FooterView(showBookingAlert: $showAlert)
        .previewLayout(.fixed(width: 375, height: 80))
}
