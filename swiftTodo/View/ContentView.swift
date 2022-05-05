//
//  ContentView.swift
//  swiftTodo
//
//  Created by Mohammed aabid on 05/05/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var todoDataStore: TodoDataStore
    @State private  var modelType: ModelType? = nil
    
    var todos: [String]  = []
    var body: some View {
        NavigationView{
            VStack{
            if(todoDataStore.todos.isEmpty){
                Text("No Todo in List")
            }else{
            List{
                
                ForEach(todoDataStore.todos){
                    todo in
                    Button{
                        
                        modelType = .update(todo)
                        
                    }label:  {
                        HStack {
                            Image(systemName: todo.completed ? "checkmark.circle.fill": "checkmark.circle")
                                .foregroundColor(todo.completed ? .gray : .blue)
                            Text(todo.name)
                                .font(.title3)
                                .strikethrough(todo.completed)
                                .foregroundColor(todo.completed ? .gray : .blue)
                            
                        }
                    }
                    
                }.onDelete(perform: todoDataStore.deleteTodo)
                
            }}
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading, content: {
                    Text("Todo List")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                })
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button{
                        modelType = .new
                    }label: {
                        HStack {
                            Image(systemName: "plus")
                            Text("Add")
                        }
                    }
                    
                    
                })
                
            }
           
            
        }
        .sheet(item: $modelType){
            $0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TodoDataStore())
    }
}
