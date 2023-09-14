//
//  API.swift
//  ToDo App
//
//  Created by Julian Marzabal on 29/08/2023.
//

import Foundation
protocol APIProtocol:ObservableObject {
    
}

class API:APIProtocol, ObservableObject {
    internal init(authorizationManager: AuthorizationManager) {
        self.authorizationManager = authorizationManager
    }
    
    var authorizationManager: AuthorizationManager
}
