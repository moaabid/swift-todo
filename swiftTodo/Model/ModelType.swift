//
//  ModelType.swift
//  swiftTodo
//
//  Created by Mohammed aabid on 05/05/22.
//

import Foundation
import SwiftUI


enum ModelType: Identifiable, View{
    case new
    case update(TodoModel)
    var id: String{
        switch self {
        case .new:
            return "new"
        case .update:
            return "update"
        }
        
    
    }
    
    var body: some View{
        switch self{
        case .new:
            return TodoFormView(formVm: TodoFormViewModel())
        case .update(let todo):
            return TodoFormView(formVm: TodoFormViewModel(todo))
        }
    }
    
}
