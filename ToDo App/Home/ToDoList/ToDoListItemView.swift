//
//  ToDoListItemView.swift
//  ToDo App
//
//  Created by Julian Marzabal on 27/08/2023.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewmodel =  ToDoListViewModel()
    let item: ItemModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color.gray)
            }
            
            Spacer()
            
            Button {
                viewmodel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
            
            
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(id: "123", title: "milei 2023", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
    }
}
