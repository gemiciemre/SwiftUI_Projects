//
//  SourceLinkView.swift
//  Fruits
//
//  Created by Emre Gemici on 14.07.2023.
//

import SwiftUI

struct SourceLinkView: View {
    //: MARK - PROPERTIES
    var fruit : Fruit
    
    //: MARK -BODY
    var body: some View {
        GroupBox(){
            HStack{
                Text("Content Source")
                Spacer()
                Link("Wikipedia", destination: URL(string: "https://en.wikipedia.org/wiki/\(fruit.title)")!)
                Image(systemName: "arrow.up.right.square")
            }//: HSTACK
            .font(.footnote)
        }//: GROUP
    }
}

struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView(fruit: fruitsData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
