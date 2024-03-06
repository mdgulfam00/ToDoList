//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Md Gulfam on 28/02/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class NewItemViewViewModel:ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    init(){
        
    }
    func save(){
        guard canSave else{
            return
        }
        
        //Get curr user Id
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        //createModel
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   isDone: false,
                                   createdDate: Date().timeIntervalSince1970)
        
        //SaveModel
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    var canSave:Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        return true
    }
}
