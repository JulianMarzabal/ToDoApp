//
//  HomeView.swift
//  ToDo App
//
//  Created by Julian Marzabal on 13/08/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct HomeView: View {
    @StateObject var viewmodel: HomeViewModel
    init() {
        self._items = FirestoreManagers.shared.getFirestoreQuery()
        self._viewmodel = StateObject(wrappedValue: HomeViewModel())
    }

    @FirestoreQuery var items: [ItemModel]
    
 
//    init(userID: String) {
//        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
//        self._viewmodel = StateObject(wrappedValue: HomeViewModel(userID: userID))
//
//    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button {
                                //viewmodel.delete(id: item.id)
                                viewmodel.delete(id: item.id)
                                
                                
                            } label: {
                                Text("delete")
                                    .foregroundColor(Color.red)
                            }
                            .tint(.red)
                        }
                    
                }
                .listStyle(PlainListStyle())
                    
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // action
                    viewmodel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewmodel.showingNewItemView) {
                NewItemView(newItemPresented: $viewmodel.showingNewItemView)
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
