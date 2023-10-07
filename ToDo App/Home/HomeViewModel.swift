//
//  HomeViewModel.swift
//  ToDo App
//
//  Created by Julian Marzabal on 13/08/2023.
//

import Foundation
import FirebaseFirestore
/// viewmodel
class HomeViewModel: ObservableObject {
    @Published var showingNewItemView = false
 
    
    
    
    func delete(id:String) {
        FirestoreManager.shared.deleteDocument(id: id)
    }
}
