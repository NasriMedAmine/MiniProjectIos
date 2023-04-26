//
//  ListUsers.swift
//  SwiftUI2
//
//  Created by Mac Mini 11 on 30/3/2023.
//

import SwiftUI



struct ListUsers: View {
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
                    List{
                        NavigationLink(destination: ProfileUser(user: user1))
                        {
                            CardUserItem(user: user1)
                                .listRowSeparator(.hidden)
                        }
                        NavigationLink(destination: ProfileUser(user: user2))
                        {
                            CardUserItem(user: user2)
                                .listRowSeparator(.hidden)
                                
                        }
                        NavigationLink(destination: ProfileUser(user: user2))
                        {
                            CardUserItem(user: user2)
                                .listRowSeparator(.hidden)
                        }
                    }
                }
                .listStyle(.plain)
                
            }
        }
        

    }
}

struct ListUsers_Previews: PreviewProvider {
    static var previews: some View {
        ListUsers()
    }
}
