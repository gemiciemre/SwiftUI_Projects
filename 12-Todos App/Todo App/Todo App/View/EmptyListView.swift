//
//  EmptyListView.swift
//  Todo App
//
//  Created by Emre Gemici on 22.09.2023.
//

import SwiftUI

struct EmptyListView: View {
    
    @State private var isAnimating: Bool = false
    
    @ObservedObject var theme = ThemeSettings()
    var themes: [Theme] = themeData
    
    let images: [String] = [
        "illustration-no1",
        "illustration-no2",
        "illustration-no3"
    ]
    let tips: [String] = [
      "Use your time wisely.",
      "Slow and steady wins the race.",
      "Keep it short and sweet.",
      "Put hard tasks first.",
      "Reward yourself after work.",
      "Collect tasks ahead of time.",
      "Each night schedule for tomorrow."
    ]
    
    var body: some View {
        ZStack {
            VStack {
                Image("\(images.randomElement() ?? self.images[0])")
                    .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
                    .layoutPriority(1)
                    .foregroundStyle(themes[self.theme.themeSettings].themeColor)
                Text("\(tips.randomElement() ?? self.tips[0])")
                    .layoutPriority(0.5)
                    .font(.system(.headline,design: .rounded))
                    .foregroundStyle(themes[self.theme.themeSettings].themeColor)
            }//:  VSTACK
            .padding(.horizontal)
            .opacity(isAnimating ? 1 : 0)
            .offset(y: isAnimating ? 0 : -50)
            .animation(.easeOut(duration: 1.5))
            .onAppear(perform: {
                self.isAnimating.toggle()    
            })
             
        }//: ZSTACK
        .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0, maxHeight: .infinity)
        .background(Color("ColorBase"))
        .edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    EmptyListView()
}
