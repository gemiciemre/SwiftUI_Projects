//
//  AppView.swift
//  Avocados
//
//  Created by Emre Gemici on 1.09.2023.
//

import SwiftUI
import Combine

struct AppView: View {
    
    // MARK: - PROPERTIES
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .soft)
    
    var body: some View {
        TabView(){
            AvocadosView()
                .tabItem({
                    Image("tabicon-branch")
                    Text("Avocados")
                })
                .onAppear{
                    hapticImpact.impactOccurred()
                }
            ContentView()
                .tabItem({
                    Image("tabicon-book")
                    Text("Recipes")
                })
                .onAppear{
                    hapticImpact.impactOccurred()
                }
            RipeningStagesView()
                .tabItem({
                    Image("tabicon-avocado")
                    Text("Ripening")
                })
                .onAppear{
                    hapticImpact.impactOccurred()
                }
            SettingsView()
                .tabItem({
                    Image("tabicon-settings")
                    Text("Settings")
                })
                .onAppear{
                    hapticImpact.impactOccurred()
                }
        }
        .accentColor(Color.primary)
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
