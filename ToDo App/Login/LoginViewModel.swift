//
//  ToDoListItem.swift
//  ToDo App
//
//  Created by Julian Marzabal on 06/08/2023.
//

import Foundation

import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMesage = ""
    let emailValidator = ValidateEmail()
    let passwordValidator = ValidatePassword()

    
    init() {}
    
    func login() {
        errorMesage = ""
        guard !email.isEmpty, !password.isEmpty else {
            errorMesage = "Please fill in  all fields"
            return
        }
        
        loginUser()
        
        
    }
    private func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) {authResult,error in
            if let error = error {
                self.errorMesage = "Cannot find this user"
            } else {
                print("To To do App")
                
                
            }
        }
    }
    
    
    
    }
