//
//  Model.swift
//  TodoList
//
//  Created by Medhat Mebed on 12/26/23.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    var id: String
    let title: String
    let isCompleted: Bool
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
