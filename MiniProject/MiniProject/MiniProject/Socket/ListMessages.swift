//
//  ListMessages.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 7/5/2023.
//

import SwiftUI








struct Message: Identifiable,Hashable {
    let id = UUID()
    let sender: String
    let email: String
    let text: String

}





struct ListMessages: View {
    
    @ObservedObject var manager2 = SocketIOManager()

    
    init(manager2: SocketIOManager = SocketIOManager()) {
        self.manager2 = manager2
    }
    
    
    
    let messagesFinal = [
            Message(sender: "John", email: "john@example.com", text: "Hello, how are you?"),
            Message(sender: "Sarah", email: "sarah@example.com", text: "I'm doing well, thanks. How about you?"),
            Message(sender: "John", email: "john@example.com", text: "I'm good too. What have you been up to?"),
            Message(sender: "Sarah", email: "sarah@example.com", text: "Not much, just working. How about you?"),
            Message(sender: "John", email: "john@example.com", text: "Same here. Hey, do you want to grab lunch sometime this week?"),
            Message(sender: "Sarah", email: "sarah@example.com", text: "Sure, that sounds good. How about Thursday?"),
            Message(sender: "John", email: "john@example.com", text: "Thursday works for me. Let's meet at that new sushi place downtown.")
        ]
        
        var body: some View {
            NavigationView{
                
                
                VStack{
//                    List(manager2.messagesAll ,id: \.self) { message in
//                        NavigationLink(destination: ChatView(manager: manager2, emailTOUser: message.email, nameTOUser: message.sender))
//                        {
//                            cardListMessage(manager: manager2, message: message)
//
//                        }
//                    }
//                    .onAppear{
//                        manager2.getAllMessage(name: SingletonClass.shared.nameUser)
//
//                    }
                    
                    List(messagesFinal) { message in
                        NavigationLink(destination: ChatView(manager: manager2, emailTOUser: messagesFinal[0].email, nameTOUser: messagesFinal[0].sender))
                        {
                            cardListMessage(manager: manager2, message: messagesFinal[0])
//                            cardListMessage(manager: manager2, message: messagesFinal[0])
//                            cardListMessage(manager: manager2, message: messagesFinal[0])
//                            cardListMessage(manager: manager2, message: messagesFinal[0])
//                            cardListMessage(manager: manager2, message: messagesFinal[0])
//                            cardListMessage(manager: manager2, message: messagesFinal[0])

                        }
                    }
                    .onAppear{
                        manager2.getAllMessage(name: SingletonClass.shared.nameUser)
                        
                    }
                }
                
                
            }
            
        }
    
    
    
    
    
    
    
}

struct ListMessages_Previews: PreviewProvider {
    static var previews: some View {
        ListMessages()
    }
}
