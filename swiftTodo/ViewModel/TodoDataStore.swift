//
//  TodoDataStore.swift
//  swiftTodo
//
//  Created by Mohammed aabid on 05/05/22.
//

import Foundation


class TodoDataStore: ObservableObject{
    @Published var todos: [TodoModel] = []
    
    init(){
        loadTodos()
    }
    
    
    func addTodo(_ todo: TodoModel)  {
        todos.append(todo)
    }
    
    
    func updateTodo(_ todo: TodoModel)  {
        guard let Index = todos.firstIndex(where: {$0.id == todo.id}) else{ return }
        todos[Index] = todo
    }
    
    func deleteTodo(at indexSet: IndexSet)  {
        todos.remove(atOffsets: indexSet)
    }
    func loadTodos(){
        todos = TodoModel.sampleTodo
    }
    
    func saveTodo(){
        print("Saving todos")
    }
    
}
