//
//  User.swift
//  ToDo App
//
//  Created by Julian Marzabal on 06/08/2023.
//

import Foundation


struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
