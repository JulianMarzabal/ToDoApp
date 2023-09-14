//
//  ItemModel.swift
//  ToDo App
//
//  Created by Julian Marzabal on 22/08/2023.
//

import Foundation


struct ItemModel: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
