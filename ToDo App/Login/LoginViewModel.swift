//
//  ToDoListItem.swift
//  ToDo App
//
//  Created by Julian Marzabal on 06/08/2023.
//

import Foundation

import FirebaseAuth
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMesage = ""
    let emailValidator = ValidateEmail()
    let passwordValidator = ValidatePassword()

    
    init() {}
    
    func login() async {
        errorMesage = ""
        
        guard emailValidator.validate(text: email) else {
            errorMesage = "Email incorrect"
            return
        }

        
        guard passwordValidator.validate(text: password) else {
            errorMesage = "Password incorrect"
            return
        }
            
        
        await loginUser()
        
        
    }
    private func loginUser() async {
        do {
            try await AuthorizationManager.shared.loginUser(email: email, password: password)
            
        } catch {
            errorMesage = " Something went wrong, please try again"
        }
        
    }
}
