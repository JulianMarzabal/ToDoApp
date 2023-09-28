//
//  FirestoreManagers.swift
//  ToDo App
//
//  Created by Julian Marzabal on 10/09/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import FirebaseFirestoreSwift


class FirestoreManager:ObservableObject {
    
    static let shared = FirestoreManager()
    
    private (set) lazy var db = Firestore.firestore()
    private var collection = "users"
 
    private var userID: String {
        AuthorizationManager.shared.currentUserId
    }
    
    func getFirestoreQuery() -> FirestoreQuery <[ItemModel]>{
        FirestoreQuery(collectionPath: "users/\(userID)/todos")
    }
    
    func deleteDocument(id:String) {
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(id)
            .delete()
    }
    
    func saveNewItem(uID:String,newID:String,data:ItemModel){
        
        db.collection(collection)
            .document(uID)
            .collection("todos")
            .document(newID)
            
            .setData(data.asDictionary())
        
    }
    
    
    
    
    
    
}


//func delete(id:String) {
//    let db = Firestore.firestore()
//    db.collection("users")
//        .document(userID)
//        .collection("todos")
//        .document(id)
//        .delete()
//}

//
//// save model
//let db = Firestore.firestore()
//db.collection("users")
//    .document(uID)
//    .collection("todos")
//    .document(newID)
//    .setData(newItem.asDictionary())
