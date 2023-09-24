//
//  AddToDoView.swift
//  Todo App
//
//  Created by Emre Gemici on 22.09.2023.
//

import SwiftUI

struct AddToDoView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    @State private var errorShowing: Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    
    @ObservedObject var theme = ThemeSettings()
    var themes: [Theme] = themeData
    
    let priorites = [ "High", "Normal", "Low"]
    // MARK: - BODY
    var body: some View {
        NavigationView{
            VStack {
                VStack(alignment:.leading, spacing: 20 ){
                    // MARK: - SELECTION
                    TextField("Todo", text: $name)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(9)
                        .font(.system(size: 24,weight: .bold, design: .default))
                    
                    // MARK: - SELECTION
                    Picker("Priority", selection: $priority, content: {
                        ForEach(priorites, id: \.self){
                            Text($0)
                        }
                    })
                    .pickerStyle(.segmented)
                    
                    // MARK: - SAVE BUTTON
                    Button(action: {
                        if self.name != ""{
                            let todo = Todo(context: self.managedObjectContext)
                            todo.name = self.name
                            todo.priority = self.priority
                            
                            do{
                                try self.managedObjectContext.save()
                                //print("New Todo: \(todo.name ?? "") Priority: \(todo.priority ?? "")")
                            }catch{
                                print(error)
                            }
                        }else{
                            self.errorShowing = true
                            self.errorTitle = "Invalid Name"
                            self.errorMessage = "Make sure to enter something for\nthe new todo item."
                            return
                        }
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }, label: {
                        Text("Save")
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(themes[self.theme.themeSettings].themeColor)
                            .cornerRadius(9)
                            .foregroundColor(Color.white)
                        
                    })
                }//: VSTACK
                .padding(.horizontal)
                .padding(.vertical,30 )
                Spacer()
            }//: VSTACK
            .navigationTitle("New Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                })
            }
            .alert(isPresented:$errorShowing, content: {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            })
        }//: NAVIGATION
        .accentColor(themes[self.theme.themeSettings].themeColor)
    }
}

// MARK: - PREVIEW
#Preview {
    AddToDoView()
}
