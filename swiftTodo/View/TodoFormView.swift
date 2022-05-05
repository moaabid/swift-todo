//
//  TodoFormView.swift
//  swiftTodo
//
//  Created by Mohammed aabid on 05/05/22.
//

import SwiftUI

struct TodoFormView: View {
    @EnvironmentObject var todoDataStore: TodoDataStore
    @ObservedObject  var formVm: TodoFormViewModel
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            Form{
                VStack(alignment: .leading){
                    TextField("Todo",text:  $formVm.name)
                    Toggle("Completed", isOn: $formVm.completed)
                }
            }.toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    cancelButton
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    updateAddButton
                }
            }.navigationTitle("Todo")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
}


extension TodoFormView {
    func updateTodo(){
        let Todo = TodoModel(id: formVm.id!, name: formVm.name,completed: formVm.completed )
        todoDataStore.updateTodo(Todo)
        presentationMode.wrappedValue.dismiss()
    }
    func addTodo() {
        let Todo = TodoModel(name: formVm.name)
        todoDataStore.addTodo(Todo)
        presentationMode.wrappedValue.dismiss()
    }
    
    var cancelButton : some View {
        Button("Cancel", action: {
            presentationMode.wrappedValue.dismiss()
        })
    }
    
    var updateAddButton : some View
    {
        Button(formVm.updating ? "Update" : "Add", action: {
            formVm.updating ? updateTodo() : addTodo()
        }).disabled(formVm.isDisable)
    }
    
}

struct TodoFormView_Previews: PreviewProvider {
    static var previews: some View {
        TodoFormView(formVm: TodoFormViewModel())
            .environmentObject(TodoDataStore())
    }
}
