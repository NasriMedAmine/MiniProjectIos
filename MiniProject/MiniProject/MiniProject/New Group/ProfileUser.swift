//
//  ProfileUser.swift
//  SwiftUI2
//
//  Created by Mac Mini 11 on 30/3/2023.
//

import SwiftUI

struct ProfileUser: View {
    @ObservedObject var manager = SocketIOManager()

    let user : UserYassine
    var body: some View {
        NavigationView{

        VStack{
            VStack{
                Image(user.photoName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipped()
                    .cornerRadius(150)
                    .shadow(radius: 5)
                
                Text(user.name)
                    .font(.title).bold()
                    .fontWeight(.medium)
                
             
            }
            
            Spacer().frame(height: 158)
            Section{
                HStack{
                    VStack{
                        Button(action: {
                            print("nzeelt donate")
                        }) {
                            Image("donate")
                            Text("Donas")
                            
                        }
                    }
                    Spacer()
                    VStack{
                        Button(action: {
                            print("nzeelt event")
                        }) {
                            Image("calendar")
                            Text("Event")
                            
                        }
                    }
                    
                    Spacer()
                    VStack{
                        NavigationLink(destination: ChatView(manager: manager, emailTOUser: user.email, nameTOUser: user.username))
                        {
                            Text("Chats")

                        }
                        
                    }
                    
                    
                    
                    
                }
                
                Section{
                    HStack{
                        Text("FullName")
                        Spacer()
                        Text(user.name)
                            .foregroundColor(.gray)
                    }.padding()
                    HStack{
                        Text("Email")
                        Spacer()
                        Text(user.email)
                            .foregroundColor(.gray)
                    }.padding()
                    HStack{
                        Text("Phone")
                        Spacer()
                        Text(String(user.tel))
                            .foregroundColor(.gray)
                        
                    }.padding()
                
                }
                
                ZStack{
//                    NavigationLink(destination: TestCodeQr(nameUser: user.name, emailUser: user.email, TelUser: user.tel))
                    NavigationLink(destination: TestFaceId())
                    {
                        Text("Code QR")
                            .font(.title).bold()
                            .fontWeight(.medium)

                    }
                    
                    
                    
                }
                

                
            }
                
        
            
        
            
        }
        

    
        
        
        
        }
        
    }
    
}

struct ProfileUser_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUser(user: UserYassine(id: "4444", name: "yassine", username: "yassine", email: "yassine", password: "yassine", tel: 44444, photoName: "logo.png"))
            .padding(.top, 40)
            
    }
}
