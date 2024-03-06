//
//  ToDoListItemsViews.swift
//  ToDoList
//
//  Created by Md Gulfam on 28/02/24.
//

import SwiftUI
import FirebaseFirestoreSwift
struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery var items : [ToDoListItem]
    
    init(userId: String){
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    var body: some View {
        NavigationView{
            VStack{
                List(items) {item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
                .navigationTitle("To Do List")
                .toolbar{
                    Button{
                        //Action
                        viewModel.showingNewItemView = true
                    }label:{
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $viewModel.showingNewItemView){
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                }
            }
        }
    }
    
    struct toDoListView_Preview : PreviewProvider{
        static var previews: some View{
            ToDoListView(userId: "8nvD0m9QkcX0etoHnC48SpS8aBq1")
        }
    }

