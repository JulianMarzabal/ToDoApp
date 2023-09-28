//
//  ToDoViewModel.swift
//  ToDo App
//
//  Created by Julian Marzabal on 03/09/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListViewModel: ObservableObject {
    
    init() {}
    func toggleIsDone(item: ItemModel) {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard  AuthorizationManager.shared.currentUserId != "" else {
            return
        }
        
       
        FirestoreManager.shared.db
            .collection("users")
            .document(AuthorizationManager.shared.currentUserId)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())

        
    }
   
    
    
    
}
