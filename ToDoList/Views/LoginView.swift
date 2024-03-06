//
//  LoginView.swift
//  ToDoList
//
//  Created by Md Gulfam on 28/02/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "List App",
                           subTitle: "Have Reminder on Things",
                           angle: 15,
                           background: .pink)
                
                
                
                //LoginForm
                
                Form{
                    
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address",text:$viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    SecureField("Password",text:$viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log in", 
                             background: .blue){
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y:-50)
                
                
                //CreateAccount
                VStack{
                    Text("New Around Here?")
                    NavigationLink("Create an account", destination: RegisterView())
                }
                .padding(.bottom,50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews:PreviewProvider {
    static var previews: some View{
        LoginView()
    }
}
