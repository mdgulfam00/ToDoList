//
//  RegisterView.swift
//  ToDoList
//
//  Created by Md Gulfam on 28/02/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        
        VStack{
            //header
            HeaderView(title: "Register Yourself",
                       subTitle: "Start Creating Task",
                       angle: -15,
                       background: .orange)
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account",
                         background: .green){
                    //Attempt to Registration
                    viewModel.register()
                }
                .padding()
            }
            .offset(y:-50)
            
            Spacer()
        }
        
    }
}

struct RegisterView_Previews:PreviewProvider {
    static var previews: some View{
        RegisterView()
    }
}
