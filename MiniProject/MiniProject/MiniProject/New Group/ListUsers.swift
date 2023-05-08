//
//  ListUsers.swift
//  SwiftUI2
//
//  Created by Mac Mini 11 on 30/3/2023.
//

import SwiftUI



struct ListUsers: View {
    @StateObject private var viewModel = ModelListUser()

    
    @State private var text = ""
    var body: some View {
        NavigationView{
            VStack{
                TextField("Search for user" ,text: $text )
                                    .padding()
                                    .background(Color(red: 0.7529411764705882, green: 0.9647058823529412, blue: 0.9529411764705882))
                                    .cornerRadius(110.0)
                                    .frame(width: 350.0)
                ZStack{
                    
                    
                    
                    
//                    List(self.viewModel.listCardUserItem) {user in
//
//                        NavigationLink(destination: ProfileUser(user: user))
//                        {
//                            CardUserItem(user: user)
//                                .listRowSeparator(.hidden)
//                        }
//                                    }
                    
                    
                    
                    
                    
                    List(viewModel.listCardUserItem) { user in
                        NavigationLink(destination: ProfileUser(user: user)) {
                            CardUserItem(user: user)
                                .listRowSeparator(.hidden)
                        }
                        
                    }
                    
                    
                        
                   
                }
                .listStyle(.plain)
                .onAppear {
                    self.viewModel.fetchUser()
                    
                }
                
            }
            
        }
        //.frame(height: 500.0)
        .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List Users")
            
            
            
            
                }
        
        

    }
}

struct ListUsers_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            ListUsers()
                }
    }
}
