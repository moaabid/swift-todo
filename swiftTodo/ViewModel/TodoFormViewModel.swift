//
//  TodoFormViewModel.swift
//  swiftTodo
//
//  Created by Mohammed aabid on 05/05/22.
//

import Foundation


class TodoFormViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var completed = false
    var id: String?
    
    var updating: Bool {
        id != nil
    }
    
    var isDisable: Bool{
        name.isEmpty
    }
    
    init(){}
    
    init(_ currentTodo: TodoModel) {
        self.name = currentTodo.name
        self.completed = currentTodo.completed
        id = currentTodo.id
    }
}
