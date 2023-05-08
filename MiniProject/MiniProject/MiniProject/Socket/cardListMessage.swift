//
//  cardListMessage.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 7/5/2023.
//

import SwiftUI



struct cardListMessage: View {
    @ObservedObject var manager2 : SocketIOManager  = SocketIOManager()

    let emailUser : String = SingletonClass.shared.emailUser
    
    
    
    let message : Message
    
    
    init(manager: SocketIOManager, message: Message) {
        self.manager2 = manager
        self.message = message
    }
    
    
    var body: some View {
        NavigationView{
            NavigationLink(destination: ChatView(manager: manager2, emailTOUser: emailUser, nameTOUser: message.sender))
            {
//                HStack{
//
//                    //            Image("login_photo 1")
//                    //                .clipShape(Circle())
//                    //                .overlay(content: {
//                    //                    Circle().stroke(.gray , lineWidth: 4)
//                    //                })
//                    //                .frame(width: 10.0, height: 10.0)
//                    //                .shadow(radius : 7)
//
//                    VStack(alignment: .leading, spacing: 8) {
//                        Text(message.sender)
//                            .font(.headline)
//                            .foregroundColor(.blue)
//                        Text(message.email)
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                        Text(message.text)
//                            .font(.body)
//                    }
//                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(message.sender)
                        .font(.headline)
                        .foregroundColor(.blue)
                    Text(message.email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(message.text)
                        .font(.body)
                }
                
            }
        }
    }
}

struct cardListMessage_Previews: PreviewProvider {
    static var previews: some View {
        cardListMessage(manager: SocketIOManager(), message: Message(sender: "John", email: "john@example.com", text: "Hello, how are you?"))
    }
}
