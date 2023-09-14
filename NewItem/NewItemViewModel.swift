//
//  NewItemViewModel.swift
//  ToDo App
//
//  Created by Julian Marzabal on 13/08/2023.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation


class NewItemViewModel: ObservableObject {
    @Published var title:String = ""
    @Published var date: Date = Date()
    @Published var showAlert:Bool = false
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard date >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
    
    func save() {
        guard canSave else {
            return
        }
        
        
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        // Create model
        let newID = UUID().uuidString
        let newItem = ItemModel(id: newID,
                                title: title,
                                dueDate: date.timeIntervalSince1970,
                                createdDate: Date().timeIntervalSince1970,
                                isDone: false)
        
//        // save model
//        let db = Firestore.firestore()
//        db.collection("users")
//            .document(uID)
//            .collection("todos")
//            .document(newID)
//            .setData(newItem.asDictionary())
        
        FirestoreManagers.shared.saveNewItem(uID: uID, newID: newID, data: newItem)
        
        
        
    }
}
