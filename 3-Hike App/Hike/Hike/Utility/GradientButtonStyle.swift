//
//  GradientButtonStyle.swift
//  Hike
//
//  Created by Emre Gemici on 10.07.2023.
//

import Foundation
import SwiftUI

struct GrandientButton: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal,30)
            .background(
                
                // Conditional Statement with Nil Coalesing
                // Condition ? A : B
                configuration.isPressed ?
                // A: When user pressed the Button
                // B: When the Button is not pressed
                LinearGradient(colors: [.customGrayMedium,.customGrayLight], startPoint: .top, endPoint: .bottom)
                :
                LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(40)
        
    }
}



