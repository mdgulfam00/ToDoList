//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Md Gulfam on 28/02/24.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
