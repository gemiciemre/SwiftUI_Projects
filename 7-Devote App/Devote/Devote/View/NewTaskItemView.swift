//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Emre Gemici on 4.08.2023.
//

import SwiftUI

struct NewTaskItemView: View {
    // MARK: - PROPERTY
    
    
    // FETCHING DATA
    @Environment(\.managedObjectContext) private var viewContext // A "scratchpad" to retrieve, update and store objects.
    @State private var task: String = ""
    @Binding var isShowing: Bool
    
    private var isButtonDisabled: Bool{
        task.isEmpty
    }

    
    // MARK: - FUNCTIONS
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()
            

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            task = ""
            hideKeyboard()// task ı save ledikten sonra klavyeyi  gizliyoruz.
            isShowing = false
        }
    }

    // MARK: - BODY
    var body: some View {
        VStack{
            Spacer()
            VStack(spacing:16){
                TextField("New Task", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 24,weight: .bold,design: .rounded))
                    .padding()
                    .background(
                        Color(UIColor.systemGray6)
                    )
                    .cornerRadius(10)
                Button(action: {
                    addItem()
                }, label: {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 24,weight: .bold, design: .rounded))
                    Spacer()
                })
                .disabled(isButtonDisabled)
                .padding()
                .font(.headline)
                .foregroundColor(.white)
                .background(isButtonDisabled ? Color.gray : Color.pink)
                .cornerRadius(10)
            }//: VSTACK
            .padding(.horizontal)
            .padding(.vertical,20)
            .background(
                Color.white
            )
            .cornerRadius(16)
            .shadow(color: Color(red: 0, green: 0, blue: 0,opacity: 0.65), radius: 24)
            .frame(maxWidth: 640)
        }//: VSTACK()
        .padding()
    }
}
// MARK: - PREVIEW
struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .previewLayout(.sizeThatFits)
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}
