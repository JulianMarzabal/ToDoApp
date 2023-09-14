////
////  FirestoreManager.swift
////  ToDo App
////
////  Created by Julian Marzabal on 05/09/2023.
////
//
//import Foundation
//import FirebaseFirestore
//import FirebaseFirestoreSwift
//
//
//class FirestoreManager: ObservableObject {
//
//    static let shared = FirestoreManager()
//    @Published var userID: String? {
//        didSet {
//            guard let userID = currentUserID else {
//                return
//            }
//            self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
//        }
//    }
//    @FirestoreQuery var items: [ItemModel] {
//        didSet {
//            print("queryy3")
//        }
//    }
//
//    init() {
//        self._items = FirestoreQuery(collectionPath: "users/s8ard2vPHhSRNbj1QD6MOqYIsqr1/todos")
//    }
//
//   private  var db = Firestore.firestore()
//
//
//    var currentUserID:String? {
//        if let userID = userID, !userID.isEmpty {
//            return userID
//        } else {
//            return nil
//        }
//
//
//    }
//
//    func setUserID(id:String) -> FirestoreManager {
//        self.userID = id
//        return self
//    }
//    func delete(id:String) {
//        guard let userID = currentUserID else {
//            return
//        }
//                db.collection("users")
//                    .document(userID)
//                    .collection("todos")
//                    .document(id)
//                    .delete()
//    }
//
//    //self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
//
////    func delete(id:String) {
////        let db = Firestore.firestore()
////        db.collection("users")
////            .document(userID)
////            .collection("todos")
////            .document(id)
////            .delete()
////    }
////
///}
