//
//  RegisterView.swift
//  ToDo App
//
//  Created by Julian Marzabal on 06/08/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var  viewmodel = RegisterViewModel()
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -16, background: .brown)
            
            EntryField(entryText: $viewmodel.fullname, placeholder: "Introduce your name", title: "Name")
            EntryField(entryText: $viewmodel.email, placeholder: "Introduce your email", title: "Email")
            EntryField(entryText: $viewmodel.password, placeholder: "Create a password", title: "Password", image: .closeEye)
            
            
            ButtonView(title: "Create Account", background: .brown) {
                viewmodel.registerUser()
                
                
            }
            .padding(.top, 10)
         
            
         
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
