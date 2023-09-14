//
//  ToDoView.swift
//  ToDo App
//
//  Created by Julian Marzabal on 13/08/2023.
//

import SwiftUI

struct ToDoView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("First", systemImage: "note.text")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
