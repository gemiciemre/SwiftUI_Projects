//
//  ListRowItemView.swift
//  Devote
//
//  Created by Emre Gemici on 15.08.2023.
//

import SwiftUI

struct ListRowItemView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item : Item
    
    
    var body: some View {
        Toggle(isOn: $item.completion){
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? Color.pink : Color.primary)
                .padding(.vertical,8)
                .animation(.default)
        }//: TOGGLE
        .toggleStyle(CheckBoxStyleView())
        .onReceive(item.objectWillChange, perform:{ _ in
            if self.viewContext.hasChanges{
                try? self.viewContext.save()
            }
        })
    }
}

