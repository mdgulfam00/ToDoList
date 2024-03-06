//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Md Gulfam on 28/02/24.
//

//ViewModel for list of item
//Primary tab
import Foundation
import FirebaseFirestore
class ToDoListViewViewModel:ObservableObject{
    @Published var showingNewItemView = false
    private let userId : String
    init(userId:String){
        self.userId = userId
    }
    
    //delete to do list item
    func delete(id:String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
