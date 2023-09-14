//
//  Coordinator.swift
//  ToDo App
//
//  Created by Julian Marzabal on 13/08/2023.
//

import Foundation


class Coordinator: ObservableObject {
    @Published var navigateToNextView = false
    
    func showNewScreen() {
        
        navigateToNextView = true
    }
}
