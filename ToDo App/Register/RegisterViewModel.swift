//
//  RegisterViewModel.swift
//  ToDo App
//
//  Created by Julian Marzabal on 13/08/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class RegisterViewModel: ObservableObject {
    @Published var fullname:String = ""
    @Published var email:String = ""
    @Published var password:String = ""
    
    var coordinator: Coordinator?
    
    
    init() {}
    
    func validate() {
        // Validate all fields
    }
    
    func registerUser() {
        Auth.auth().createUser(withEmail: email, password: password) {[weak self]result, error in
            guard let userID = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userID)
            print("guardadoo")
           // self?.coordinator?.toToDoApp()
        }
    }
    
    private func insertUserRecord(id:String) {
        let newUser = User(id: id, name: fullname , email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
        
        
    }
    
    
    
}
