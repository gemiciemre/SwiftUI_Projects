//
//  CenterModifier.swift
//  Africa
//
//  Created by Emre Gemici on 26.07.2023.
//

import SwiftUI

struct CenterModifier : ViewModifier{
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
