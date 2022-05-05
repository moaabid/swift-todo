//
//  TodoModel.swift
//  swiftTodo
//
//  Created by Mohammed aabid on 05/05/22.
//

import Foundation
 
struct TodoModel: Codable, Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var completed: Bool = false
    
    static var sampleTodo: [TodoModel] {
        [
            TodoModel(name: "Brush Teeth",completed: false),
            TodoModel(name: "Eat Breakfast",completed: true),
        ]
        
    }
    
}
