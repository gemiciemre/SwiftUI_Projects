//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Emre Gemici on 18.08.2023.
//

import SwiftUI

struct HeaderView: View {
    
    var title: String = ""
    
    var body: some View {
        VStack {
            //TITLE
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            //SEPARATOR
            HStack{
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height: 1)
            }//: HSTACK
            .foregroundColor(.accentColor)
        }//: VSTACK
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            HeaderView(title: "Credits")
            
            HeaderView()
        }
       
    }
}
