//
//  FileManager+Extension.swift
//  swiftTodo
//
//  Created by Mohammed aabid on 05/05/22.
//

import Foundation


let fileName = "Todo.json"

extension FileManager{
    static var docDirURL : URL {
        return self.default.urls(for: .documentDirectory, in: .userDomainMask ).first!
    }
}
