//
//  HomeViewModel.swift
//  ToDo App
//
//  Created by Julian Marzabal on 13/08/2023.
//

import Foundation
import FirebaseFirestore

class HomeViewModel: ObservableObject {
    @Published var showingNewItemView = false
    //private let userID: String
    
//    init(userID:String) {
//        self.userID = userID
//    }
    
    
    
    
    func delete(id:String) {
        FirestoreManagers.shared.deleteDocument(id: id)
    }
}
