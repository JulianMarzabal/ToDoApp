//
//  ToDo_AppApp.swift
//  ToDo App
//
//  Created by Julian Marzabal on 06/08/2023.
//
import FirebaseCore
import SwiftUI

@main
struct ToDo_AppApp: App {
    @Environment(\.scenePhase) var scenePhase
    init() {
        FirebaseApp.configure()
        AuthorizationManager.shared.authStateHandler()
    }
    //s8ard2vPHhSRNbj1QD6MOqYIsqr1
    var body: some Scene {
        WindowGroup {
            
            MainView()
                
                .environmentObject(AuthorizationManager.shared)
                //.environmentObject(FirestoreManager.shared.setUserID(id: "s8ard2vPHhSRNbj1QD6MOqYIsqr1"))
                
        }
        .onChange(of: scenePhase) { newValue in
            switch newValue {
            case .background: print("onBackground")
            case .active: print("onActive")
            case .inactive: print("goInactive")
            default: print("Defaulteamos la deuda ")
            }
        }
        
    }
}
