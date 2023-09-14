//
//  ProfileView.swift
//  ToDo App
//
//  Created by Julian Marzabal on 06/08/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewmodel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewmodel.user {
                    profile(user:user)
                } else {
                    Text("Loading profile ...")
                }
                
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewmodel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user:User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125, alignment: .center)
        
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                Text(user.name)
                
            }
            HStack {
                Text("Email: ")
                Text(user.email)
            }
            HStack {
                Text("Member Since: ")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        
        ButtonView(title: "Log Out", background: .red) {
            //
            viewmodel.logOut()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
