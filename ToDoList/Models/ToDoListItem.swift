//
//  ToDoListtem.swift
//  ToDoList
//
//  Created by Md Gulfam on 28/02/24.
//

import Foundation

struct ToDoListItem:Codable,Identifiable{
    let id:String
    let title:String
    let dueDate:TimeInterval
    var isDone: Bool
    let createdDate:TimeInterval
    
    mutating func setDone(_ state:Bool){
        isDone = state
    }
}
