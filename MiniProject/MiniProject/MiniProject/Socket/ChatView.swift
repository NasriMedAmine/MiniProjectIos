
import SwiftUI
import UIKit

import Alamofire


import SwiftyJSON


import CoreData

struct ChatView: View {
    // The SocketIOManager instance
    @ObservedObject var managerView = SocketIOManager()
    
    @State var token: String = ""
    @State var nameUserME: String = ""
    let emailToUser: String
    let nameToUser: String

    
    
    @State private var isShowingImagePicker = false
    @State private var selectedImage: UIImage?
    
    
    
    
    
    
    // The text entered by the user
    @State var messageText: String = ""
    
    
    init(manager: SocketIOManager,emailTOUser : String, nameTOUser : String) {
        self.managerView = manager
        self.emailToUser = emailTOUser
        self.nameToUser = nameTOUser
        
        
        
        
        // Send a message when the view is initialized
        
        
        
        
        
//        if let tokenDB = self.getMyUserTokenChat() as? String {
//            if let NameDB = self.getMyUserNameChat() as? String {
//                self.token = tokenDB
//                self.nameUserME = NameDB
//
//                print("----------------------------------------------------")
//                print("----------------------------------------------------")
//                print(self.token)
//                print(self.nameUserME)
//                print(self.emailToUser)
//                print("----------------------------------------------------")
//
//                self.managerView.sendWhoIam(token: tokenDB, name: NameDB)
             
//            }
//        }

        
        
        
        }
        
        
        
        var body: some View {
            VStack {
                // List of messages
                List(managerView.messages, id: \.self) { message in
                    
                    
                    if(message.isImage == true){
                        ChatImageRow(chatMessage: ChatMessage2(NameImage: "name"))
                    }
                    else{
                        if(message.token == self.token){
                            ChatRow(chatMessage: ChatMessage(message: message.message, avatar: self.nameUserME, color: .green, isMe: true))
                        }
                        else{
                            ChatRow(chatMessage: ChatMessage(message: message.message, avatar: self.nameToUser, color: .gray, isMe: false))

                        }
                    }
                }
                .onAppear{
                    let emailUser = SingletonClass.shared.emailUser
                    print("---------------------------------")
                    print("---------------------------------")
                    print("emailUser")
                    print(emailUser)
                    
                    //self.managerView.sendMeOldMessages(email:emailUser)
                }
                
                
                // Text input and send button
                HStack {
                    TextField("Enter message", text: $messageText)
                    
                    VStack{
                        
                        Button(action: {
                            managerView.sendMessage(message: messageText,tokenFromUser: self.token,emailToUser: self.emailToUser)
                            messageText = ""
                        }) {
                            Text("Send")
                        }
                        
                        Button(action: {
                            
                            isShowingImagePicker = true

                           
                        }) {
                            Text("image")
                        }
                        
                    }
                    .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                                ImagePicker(selectedImage: $selectedImage)
                            }
                }
                .padding()
                .onAppear {
                            if let tokenDB = self.getMyUserTokenChat() as? String {
                                if let NameDB = self.getMyUserNameChat() as? String {
                                    self.token = tokenDB
                                    self.nameUserME = NameDB

                                    managerView.sendWhoIam(token: tokenDB, name: NameDB)
                                }
                            }
                    print("----------------------------------------------------")
                    print("----------------------------------------------------")
                    print(self.token)
                    print(self.nameUserME)
                    print(self.emailToUser)
                    print("----------------------------------------------------")
//
                    
                    
                    print("----------------------------------------------------")
                    

                    

                        }
            }
        }
        
        
        
    
    
    func loadImage() {
            guard let selectedImage = selectedImage else { return }
            // Do something with the selected image
            print("Selected image: \(selectedImage)")
        
        guard let imageData = selectedImage.jpegData(compressionQuality: 0.5) else {
            print("Failed to convert image to Data")
            return
        }
        let url = "http://localhost:3007/user/imagePickerMessage"

        AF.upload(multipartFormData: { multipartFormData in
                    
                    multipartFormData.append(imageData, withName: "image", fileName: "ChatImageRow001", mimeType: "image/jpeg")
                }, to: url,method: .post).responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        print("Response: \(value)")
                        let jsonRes = JSON(value)
                        print(jsonRes)
                        
                        
                        

                        
                        managerView.sendImage(nameImage: "ChatImageRow001")

                        
                        
                        
                    case .failure(let error):
                        print("Error: \(error)")
                    }
                }
        
        }
    
    
    
    
    
    
    
    func getMyUserTokenChat() -> String! {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistenContainer = appDelegate.persistentContainer
        let managedContext = persistenContainer.viewContext
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "User")
        
        
        
        
        
        
        
        do {
            let users = try managedContext.fetch(request)
            
            print("save++++++++++++++++++++++++++++++++++++++++")
            
            print(users)
            
            print(users.count)
            //print(users[0].value(forKey: "email"))
            
            print("++++++++++++++++++++++++++++++++++++++++")
            
            if(users.count > 0){
                return users[0].value(forKey: "token") as! String
                
            }
            
            
            // Do some++++++Âthing with the array of movie objects that was found
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            
        }
        return nil
        
        
    }
    
    
    
    func getMyUserNameChat() -> String! {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistenContainer = appDelegate.persistentContainer
        let managedContext = persistenContainer.viewContext
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "User")
        
        
        
        
        
        
        
        do {
            let users = try managedContext.fetch(request)
            
            print("save++++++++++++++++++++++++++++++++++++++++")
            
            print(users)
            
            print(users.count)
            //print(users[0].value(forKey: "email"))
            
            print("++++++++++++++++++++++++++++++++++++++++")
            
            if(users.count > 0){
                return users[0].value(forKey: "name") as! String
                
            }
            
            
            // Do some++++++Âthing with the array of movie objects that was found
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            
        }
        return nil
        
        
    }
}
    
    





    
struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedImage: UIImage?

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                parent.selectedImage = selectedImage
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
}
