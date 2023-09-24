//
//  FormRowLinkView.swift
//  Todo App
//
//  Created by Emre Gemici on 24.09.2023.
//

import SwiftUI

struct FormRowLinkView: View {
    
    var icon: String
    var color: Color
    var text: String
    var link: String
    
    
    var body: some View {
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                Image(systemName: icon)
                    .imageScale(.large)
                    .foregroundColor(Color.white)
            }
            .frame(width: 36, height: 36, alignment: .center)
            
            Text(text).foregroundStyle(Color.gray)
            Spacer()
            Button(action: {
                
                guard let url = URL(string: self.link), UIApplication.shared.canOpenURL(url) else{
                    return
                }
                UIApplication.shared.open(url as URL)
                
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
            })
            .accentColor(Color(.systemGray)) //Deprecated .accentColor
            
        }
    }
}

#Preview {
    FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://swiftuimasterclass.com")
        .previewLayout(.fixed(width: 375, height: 60))
        .padding()
}
