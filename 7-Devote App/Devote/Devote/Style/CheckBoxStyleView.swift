//
//  CheckBoxStyleView.swift
//  Devote
//
//  Created by Emre Gemici on 15.08.2023.
//

import SwiftUI

struct CheckBoxStyleView: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack{
            Image(systemName: configuration.isOn ? "checkmark.circle.fill": "circle")
                .foregroundColor(configuration.isOn ? .pink : .primary)
                .font(.system(size: 30,weight: .semibold,design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                    feedback.notificationOccurred(.success)
                    if configuration.isOn{
                        playSound(sound: "sound-rise", type: "mp3")
                    }else{
                        playSound(sound: "sound-tap", type: "mp3")
                    }
                }
            configuration.label
        }//: HSTACK
    }
}

struct CheckBoxStyleView_Previews: PreviewProvider {
    static var previews: some View {
        Toggle("Placeholder label", isOn: .constant(false))
            .toggleStyle(CheckBoxStyleView())
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
