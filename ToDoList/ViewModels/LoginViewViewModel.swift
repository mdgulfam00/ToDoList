//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Md Gulfam on 28/02/24.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){
        
    }
    
    func login(){
        guard validate() else{
            return
        }
        //Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func validate()->Bool{
        errorMessage=""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMessage = "Please fill in all Feilds."
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter valid Email."
            return false
        }
        return true
        
        
    }
}
