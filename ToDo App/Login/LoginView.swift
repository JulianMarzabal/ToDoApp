//
//  LoginView.swift
//  ToDo App
//
//  Created by Julian Marzabal on 06/08/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewmodel = LoginViewModel()
    
   
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink)

                
                
                EntryField(entryText: $viewmodel.email, placeholder: "Email Adress", title: "Email")
                    .padding(.top, -50)
                    .padding([.leading, .trailing],16)
                EntryField(entryText: $viewmodel.password, placeholder: "Password", title: "Password", image: .closeEye)
                    .padding(.top, 5)
                    .padding([.leading, .trailing],16)
                        

                
                
                if !viewmodel.errorMesage.isEmpty {
                    Text(viewmodel.errorMesage)
                        .padding(.top,5)
                        .foregroundColor(Color.red)
                }
                
    

                ButtonView(title: "Log in",
                           background: .blue)
                {
                   // viewmodel.login()
                    //Attemp log in

                }


                
                
                VStack {
                    
                    Text("New Around Here?")
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                .padding(.bottom,50)
                
                
                Spacer()
            }
        }
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
        }
    }
}
