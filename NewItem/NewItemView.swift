//
//  NewItemView.swift
//  ToDo App
//
//  Created by Julian Marzabal on 06/08/2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewmodel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            EntryField(entryText: $viewmodel.title  , placeholder: "Title", title: "Action", image: .null)
            
            DatePicker("Due date", selection: $viewmodel.date)
                .datePickerStyle(GraphicalDatePickerStyle())
            
            ButtonView(title: "Save", background: .blue) {
                //action
                if viewmodel.canSave {
                    viewmodel.save()
                    newItemPresented = false
                } else {
                    viewmodel.showAlert = true
                }
            }
            .padding()
        }
        .alert(isPresented: $viewmodel.showAlert) {
            Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or newer"))
        }
        
    }
            
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
