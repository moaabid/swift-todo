//
//  swiftTodoApp.swift
//  swiftTodo
//
//  Created by Mohammed aabid on 05/05/22.
//

import SwiftUI

@main
struct swiftTodoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TodoDataStore())
        }
    }
}
