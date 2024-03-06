//
//  ContentView.swift
//  ToDoList
//
//  Created by Md Gulfam on 28/02/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    @ViewBuilder
    var accountView: some View{
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem{
                    Label("Home",systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile",systemImage: "person.circle")
                }
        }
    }
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            accountView
            //To DO List View
        }else{
            LoginView()
            
        }
           
        
    }
}

struct ContentView_Previews:PreviewProvider {
    static var previews: some View{
        MainView()
    }
}
