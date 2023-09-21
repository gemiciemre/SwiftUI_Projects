//
//  InfoView.swift
//  Slot Machine
//
//  Created by Emre Gemici on 17.09.2023.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center,spacing: 10){
            LogoView()
            
            Spacer()
            
            Form{
                Section(header: Text("About the application")){
                    FormRowView(fistItem: "Application", secondItem: "Slot Machine")
                    FormRowView(fistItem: "Platroms", secondItem: "iPhone, iPad, Mac")
                    FormRowView(fistItem: "Developer", secondItem: "Emre GEMICI")
                    FormRowView(fistItem: "Designer", secondItem: "Robert PETRAS")
                    FormRowView(fistItem: "Music", secondItem: "Dan Lebowitz")
                    FormRowView(fistItem: "Website", secondItem: "swiftuimasterclass.com")
                    FormRowView(fistItem: "Copyright", secondItem: "© 2023 All rights reserved.")
                    FormRowView(fistItem: "Version", secondItem: "1.1.0")
                }
            }
            .font(.system(.body,design: .rounded))
        }
        .padding(.top,40)
        .overlay(
            Button(action: {
                audioPlayer?.stop()
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark.circle")
                    .font(.title)
            })
            .padding(.top,30)
            .padding(.trailing,20)
            .accentColor(Color.secondary)
            , alignment: .topTrailing
        )
        .onAppear(perform: {
            playSound(sound: "background-music", type: "mp3")
        })
    }
}

struct FormRowView: View {
    var fistItem: String
    var secondItem: String
    
    var body: some View {
        HStack{
            Text(fistItem).foregroundColor(Color.gray)
            Spacer()
            Text(secondItem)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}


