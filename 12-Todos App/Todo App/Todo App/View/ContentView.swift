//
//  ContentView.swift
//  Todo App
//
//  Created by Emre Gemici on 22.09.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var iconSettigs: IconNames
    
    @State private var isShowingAddToDoView: Bool = false
    @State private var animatingButton: Bool = false
    @State private var showingSettingsView:Bool = false
    
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
    
    @ObservedObject var theme = ThemeSettings()
    var themes: [Theme] = themeData
    
    var body: some View {
        NavigationView {
            ZStack {
                List{  
                    ForEach(self.todos, id: \.self){ todo in
                        HStack{
                            Circle()
                                .frame(width: 12, height: 12, alignment: .center)
                                .foregroundColor(self.colorize(priority: todo.priority ?? "Normal "))
                            Text(todo.name ?? "Unknown")
                            
                            Spacer()
                            
                            Text(todo.priority ?? "Unknown")
                                .font(.footnote)
                                .foregroundColor(Color(UIColor.systemGray2))
                                .padding(3)
                                .frame(minWidth: 62)
                                .overlay(
                                  Capsule().stroke(Color(UIColor.systemGray2), lineWidth: 0.75)
                              )
                        }
                        .padding(.vertical,10)
                    }//: FOREACH
                    .onDelete(perform: deleteTodo)
                }//: LIST
                .navigationTitle("Todo")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(){
                    
                    EditButton().accentColor(themes[self.theme.themeSettings].themeColor) // There is a problem about the placement.
                    
                    Button(action: {
                        self.showingSettingsView.toggle()
                    }, label: {
                        Image(systemName: "paintbrush")
                            .imageScale(.large)
                    })
                    .sheet(isPresented: $showingSettingsView, content: {
                        SettingsView().environmentObject(self.iconSettigs)
                    })
                 }
                // MARK: - NO TODO VIEWS 
                if todos.count == 0 {
                    EmptyListView() 
                }
            }//: ZSTACK
            .sheet(isPresented: $isShowingAddToDoView, content: {
                AddToDoView().environment(\.managedObjectContext, self.managedObjectContext) //  I don't get this line.
            })
            .overlay(
                ZStack{
                    Group{
                        Circle()
                            .fill(themes[self.theme.themeSettings].themeColor)
                            .opacity(animatingButton ? 0.2 : 0)
                            .scaleEffect(animatingButton ? 1 : 0)
                            .frame(width: 68, height: 68, alignment: .center)
                            
                        Circle()
                            .fill(themes[self.theme.themeSettings].themeColor)
                            .opacity(animatingButton ? 0.15 : 0)
                            .scaleEffect(animatingButton ? 1 : 0)
                            .frame(width: 88, height: 88, alignment: .center)
                    }
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                    Button(action: {
                        self.isShowingAddToDoView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .background(Circle().fill(Color("ColorBase")))
                            .frame(width: 48, height: 48, alignment: .center)
                    })
                    .onAppear(perform: {
                        self.animatingButton.toggle()
                    })
                }
                    .padding(.bottom,15)
                    .padding(.trailing,15)
                ,alignment: .bottomTrailing
            )
        }//: NAVIGATION
        .accentColor(themes[self.theme.themeSettings].themeColor)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    // MARK: - FUNCTION
    private func deleteTodo(at offset: IndexSet ){
        for index in offset {
            let todo = todos[index]
            managedObjectContext.delete(todo)
            
            do{
                try managedObjectContext.save()
            }catch{
                print(error)
            }
                
        }
    }
    
    private func colorize (priority: String) -> Color{
        switch priority {
        case "High" :
            return .pink
        case "Normal":
            return .green
        case "Low":
            return .blue
        default :
            return .gray
        }
    }
}




#Preview {
    ContentView()
}


// MARK: - ALTERNATE ICONS - I COULDN'T GET THIS PART

class IconNames: ObservableObject {
  var iconNames: [String?] = [nil]
  @Published var currentIndex = 0
  
  init() {
    getAlternateIconNames()
    
    if let currentIcon = UIApplication.shared.alternateIconName {
      self.currentIndex = iconNames.firstIndex(of: currentIcon) ?? 0
    }
  }
  
  func getAlternateIconNames() {
    if let icons = Bundle.main.object(forInfoDictionaryKey: "CFBundleIcons") as? [String: Any],
      let alternateIcons = icons["CFBundleAlternateIcons"] as? [String: Any] {
      for (_, value) in alternateIcons {
        guard let iconList = value as? Dictionary<String,Any> else { return }
        guard let iconFiles = iconList["CFBundleIconFiles"] as? [String] else { return }
        guard let icon = iconFiles.first else { return }
        
        iconNames.append(icon)
      }
    }
  }
}
