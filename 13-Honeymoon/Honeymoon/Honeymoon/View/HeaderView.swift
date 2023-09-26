//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Emre Gemici on 25.09.2023.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES
    
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    
    let haptics = UINotificationFeedbackGenerator()
    
    // MARK: - BODY
    var body: some View {
        HStack{
            
            Button(action: {
                playSound(sound: "sound-click", type: "mp3")
                self.haptics.notificationOccurred(.success)
                self.showInfoView.toggle()
            }, label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24,weight: .regular))
            })
            .tint(Color.primary) // instead of .accentColor()
            .sheet(isPresented: $showInfoView, content: {
                InfoView()
            })
            Spacer()
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            Spacer()
            
            Button(action: {
                // Some Action
                playSound(sound: "sound-click", type: "mp3")
                self.haptics.notificationOccurred(.success)
                self.showGuideView.toggle()
            }, label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24,weight: .regular))
            })
            .tint(Color.primary)
            .sheet(isPresented: $showGuideView, content: {
                GuideView()
            })
            
        }
        .padding()
    }
}

// MARK: - PREVIEW
#Preview(traits:.sizeThatFitsLayout) {
    
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    
    return HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
        .previewLayout(.fixed(width: 375, height: 80))
}
