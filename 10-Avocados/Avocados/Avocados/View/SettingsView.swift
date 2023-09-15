//
//  SettingsView.swift
//  Avocados
//
//  Created by Emre Gemici on 1.09.2023.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - PROPERTIES
    
    @State private var enableNotification: Bool = true
    @State private var backgroundRefresh: Bool = false
    
    var body: some View {
        VStack(alignment: .center,spacing: 0){
            // MARK: - HEADER
            VStack(alignment: .center,spacing: 5){
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                    .frame(width: 100,height: 100,alignment: .center)
                    .shadow(color: Color("ColorBlackTransparentLight"), radius: 8,x: 0,y: 4)
                Text("Avocados".uppercased())
                    .font(.system(.title,design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenAdaptive"))
            }
            .padding()
            
            Form{
                // MARK: - SECTION #1
                Section(header: Text("General Settings")){
                    Toggle(isOn: $enableNotification){
                        Text("Enable notification")
                    }
                    Toggle(isOn:$backgroundRefresh){
                        Text("Background refresh")
                    }
                }//: SECTION #1
                
                // MARK: - SECTION #2
                Section(header:Text("Application")){
                    if enableNotification {
                      HStack {
                        Text("Product").foregroundColor(Color.gray)
                        Spacer()
                        Text("Avocado Recipes")
                      }
                      HStack {
                        Text("Compatibility").foregroundColor(Color.gray)
                        Spacer()
                        Text("iPhone & iPad")
                      }
                      HStack {
                        Text("Developer").foregroundColor(Color.gray)
                        Spacer()
                        Text("Emre GEMICI")
                      }
                      HStack {
                        Text("Designer").foregroundColor(Color.gray)
                        Spacer()
                        Text("Robert Petras")
                      }
                      HStack {
                        Text("Website").foregroundColor(Color.gray)
                        Spacer()
                        Text("https://credo.academy")
                      }
                      HStack {
                        Text("Version").foregroundColor(Color.gray)
                        Spacer()
                        Text("1.5.0")
                      }
                    } else{
                        HStack{
                            Text("Personal message").foregroundColor(Color.gray)
                            Spacer()
                            Text("👍 Happy Coding!")
                        }
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
