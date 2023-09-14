//
//  ContentView.swift
//  ToDo App
//
//  Created by Julian Marzabal on 06/08/2023.
//

import SwiftUI


struct MainView: View {
    @EnvironmentObject var authorizationManager:AuthorizationManager
    @EnvironmentObject var api:API
    
    
    
    var body: some View {

        
        if authorizationManager.isSignedIn, !authorizationManager.currentUserId.isEmpty {
            ToDoView()
           // HomeView(userID: authorizationManager.currentUserId)
        } else {
            LoginView()
        }
      
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AuthorizationManager(currentUserID: "",isMocked: true,isSignedInMocked: false))
        
        MainView()
            .environmentObject(AuthorizationManager(currentUserID: "s8ard2vPHhSRNbj1QD6MOqYIsqr1",isMocked: true,isSignedInMocked: true))
    }
}
