//
//  headerUser.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 17/5/2023.
//

import SwiftUI

struct headerUser: View {
    let username: String
    @ObservedObject var managerView = SocketIOManager()

//    let isOnline: Bool
    @State private var isOnline: Bool = false

    @StateObject private var singleton = SingletonClass.shared
    
    
    init(username: String, managerView: SocketIOManager) {
        self.username = username
        self.managerView = managerView
    }
    
    
    
    
        var body: some View {
            HStack {
                // User Image
                Image("message")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                // User Name and Status
                VStack(alignment: .leading) {
                    Text(username)
                        .font(.headline)
                    Text(isOnline ? "Online" : "Offline")
                        .font(.subheadline)
                        .foregroundColor(isOnline ? .green : .red)
                }
                .onReceive(singleton.$isThatProfileConnResToHeader) { newValue in
                    print("onReceive(singleton.$isThatProfileConnRes)")
                    print("--------------------------------------------------")
                    print("--------------------------------------------------")
                            isOnline = newValue
                    print(isOnline)
                    print(newValue)
                    print("--------------------------------------------------")
                    print("--------------------------------------------------")
                        }
                
                Spacer()
                
                // Additional Buttons or Icons
                Button(action: {
                    // Action for additional buttons
                }) {
                    Image(systemName: "info.circle")
                        .font(.title2)
                }
            }
            .onAppear{
                self.managerView.isThatProfileConn(email: username, nameFromUser: SingletonClass.shared.nameUser)

            }
            
            .padding()
            .background(Color.gray.opacity(0.2))
            
        }
    
}

struct headerUser_Previews: PreviewProvider {
    static var previews: some View {
        headerUser(username: "John Doe", managerView: SocketIOManager())
    }
}

