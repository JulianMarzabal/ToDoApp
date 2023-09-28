//
//  AuthorizationManager.swift
//  ToDo App
//
//  Created by Julian Marzabal on 29/08/2023.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class AuthorizationManager:ObservableObject {
    
    static let shared = AuthorizationManager(currentUserID: "")
    private lazy var db = FirestoreManager.shared.db
    @Published var currentUserId:String
    var isMocked:Bool
    var isSignedInMocked:Bool
    
    

    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(currentUserID:String, isMocked:Bool = false, isSignedInMocked:Bool = false) {
        self.currentUserId = currentUserID
        self.isMocked = isMocked
        self.isSignedInMocked = isSignedInMocked
        
    }
    
    public var isSignedIn: Bool {
        isMocked ? isSignedInMocked : Auth.auth().currentUser != nil
         
    }
    
    func authStateHandler() {
        self.handler = Auth.auth().addStateDidChangeListener({ [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
              
            }
        })
    }
    
    func fetchUser(completion: @escaping (User?)-> Void) {
        guard let userId = Auth.auth().currentUser?.uid else {
            completion(nil)
            return
        }
       
        db.collection("users")
            .document(userId).getDocument { [weak self]snapshot, error in
                guard let data = snapshot?.data(), error == nil else {
                    return
                }
                DispatchQueue.main.async {
                   let user = User(id: data["id"] as? String ?? "",
                                      name: data["name"] as? String ?? "",
                                      email: data["email"] as? String ?? "",
                                      joined: data["joined"] as? TimeInterval ?? 0)
                    completion(user)
                }
                
            }
    }
//
//    func loginUser(email:String, password:String)  {
//        let auth = Auth.auth()
//        auth.signIn(withEmail: email, password: password) { authDataResult, error in
//
//        }
//
//    }
    
    func loginUser(email: String, password: String) async throws {
        let auth = Auth.auth()
        
        do {
            let authDataResult = try await auth.signIn(withEmail: email, password: password)
            currentUserId = authDataResult.user.uid
        } catch {
            print("error ")
            throw error
        }
    }
    
    
   
}


