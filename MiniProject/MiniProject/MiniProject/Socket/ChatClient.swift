//
//import StreamChat
//
//
//
//@available(iOS 13, *)
//extension ChatClient {
//    static var shared: ChatClient!
//}
//


import Foundation
import SocketIO



struct ChatMessageFromServer : Hashable {
    var message: String
    // isMe will be true if We sent the message
    var token: String
    
    var isImage : Bool
}
class SocketIOManager: ObservableObject {
    // The URL of the Socket.IO server
    let serverUrl = "http://localhost:3007"
    
    // The Socket.IO manager and client instances
    let manager: SocketManager
    let socket: SocketIOClient
    
    // The list of messages received from the server
    @Published var messages: [ChatMessageFromServer] = []
    
    
    
    @Published var messagesAll: [Message] = []

    
    // Initialize the Socket.IO manager and client
    init() {
        manager = SocketManager(socketURL: URL(string: serverUrl)!, config: [.log(true), .compress])
        socket = manager.defaultSocket
        
        // Add event handlers for Socket.IO events
        socket.on("connect") { data, ack in
            print("test socket io")
            print("Connected to server")
        }
        
        socket.on("messageFromServerToMobile") { data, ack in
            print("test messageFromServerToMobile")
            print(data)
            if let message = data[0] as? String {
                if let token = data[1] as? String {
                    let messageFromServer = ChatMessageFromServer(message: message, token: token , isImage: false)
                    self.messages.append(messageFromServer)
                    print("test messages messageFromServerToMobile")
                    print(self.messages)
                }
                

            }
            print("fin test messageFromServerToMobile")

        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        socket.on("imageFromServerToClient") { data, ack in
            if let nameImage = data[0] as? String {
                
                let messageFromServer = ChatMessageFromServer(message: nameImage, token: "null" , isImage: true)
                self.messages.append(messageFromServer)
                print("test messages imageFromServerToClient")
                print(self.messages)
            }

            print("test fin messages imageFromServerToClient")
        }
        
        
        
        
        
        
        
        
        
        
        socket.on("hereOldMessage") { data, ack in
            print("test socket io")

            print("hereOldMessage")
            
            
            if let jsonString = data[0] as? String,
               let jsonData = jsonString.data(using: .utf8),
               let listMessages = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: String]] {
                
                
                    
                    print("--------------------------------------------------")
                    print("--------------------------------------------------")

                    
                    print("listMessages")
                    print(listMessages)

                    print("--------------------------------------------------")
                    print("--------------------------------------------------")

                    // Now you have an array of dictionaries containing the messages
                    // You can iterate through them and manipulate as needed
                    
//                    for message in listMessages {
//                        if let messageText = message["message"],
//                           let fromEmail = message["From"]{
//
//                            // Do something with messageText and fromEmail
//                            // For example, print them out
//                            print("Message: \(messageText), From: \(fromEmail)")
//                            let tokenUser = SingletonClass.shared.token
//                            let messageFromServer = ChatMessageFromServer(message: messageText, token: tokenUser , isImage: true)
//                            self.messages.append(messageFromServer)
//                            print("test messages imageFromServerToClient")
//                            print(self.messages)
//
//
//                        }
//                    }
                
                
                for message in listMessages {
                    if let messageText = message["message"]{
                        
                        // Do something with messageText and fromEmail
                        // For example, print them out
                        let tokenUser = SingletonClass.shared.token
                        let messageFromServer = ChatMessageFromServer(message: messageText, token: tokenUser , isImage: false)
                        self.messages.append(messageFromServer)
                        print("test messages imageFromServerToClient")
                        print(self.messages)
                        
                        
                    }
                }
                
                
                
                
                }

            
            
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        socket.on("hereAllMessage") { data, ack in
            print("-----------------------------------------------------")
            print("-----------------------------------------------------")
            print("test socket io")

            print("hereAllMessage from server")
            if let jsonString = data[0] as? String,
               let jsonData = jsonString.data(using: .utf8),
               let listMessages = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: String]] {
                
                
                    
                    print("--------------------------------------------------")
                    print("--------------------------------------------------")

                    
                    print("listMessages")
                    print(listMessages)

                    print("--------------------------------------------------")
                    print("--------------------------------------------------")

                    for message in listMessages {
                        if let messageText = message["message"]{
                            if let emailText = message["email"]{
                                if let nameText = message["name"]{
                                    let messageFromServer = Message(sender: nameText, email: emailText, text: messageText)
                                    self.messagesAll.append(messageFromServer)
                                    print("test messages messagesAll")
                                    print(self.messagesAll)
                                }
                            }
                        }
                    }
                }
            
            print("-----------------------------------------------------")
            print("-----------------------------------------------------")
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        socket.on("disconnect") { data, ack in
            print("test socket io")

            print("Disconnected from server")
        }
        
        
        
        
        
        
        // Connect to the Socket.IO server
        socket.connect()
    }
    
    // Send a message to the server
    func sendMessage(message: String,tokenFromUser:String,emailToUser:String) {
        socket.emit("messageFromMobileToServer", message,tokenFromUser,emailToUser)
    }
    
    
    func sendImage(nameImage : String) {
        socket.emit("imageFromClientToServer",nameImage )
    }
    
    
    
    func sendWhoIam(token: String,name:String) {
        socket.emit("whoIam", token,name)
    }
    
    
    func sendMeOldMessages(email:String) {
        
        print("test socket io")

        print("sendMeOldMessages to server")
        
        
        socket.emit("sendMeOldMessage", email)
        
        print("sendMeOldMessages to server")

    }
    
    func getAllMessage(name:String) {
        print("-----------------------------------------------------")
        print("-----------------------------------------------------")
        print("test socket io")

        print("getAllMessage to server")
        
        
        socket.emit("getAllMessage", name)
        
        print("getAllMessage to server")
        
        print("-----------------------------------------------------")
        print("-----------------------------------------------------")

    }
}
