//
//  FruitsApp.swift
//  Fruits
//
//  Created by Emre Gemici on 12.07.2023.
//

import SwiftUI

@main
struct FruitsApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            }else{
                ContentView()
            }
            
        }
    }
}
