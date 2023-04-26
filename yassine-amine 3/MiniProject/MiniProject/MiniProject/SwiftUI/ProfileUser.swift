//
//  ProfileUser.swift
//  SwiftUI2
//
//  Created by Mac Mini 11 on 30/3/2023.
//

import SwiftUI

struct ProfileUser: View {
    
    let user : User
    var body: some View {
        
        VStack{
            VStack{
                Image(user.Photo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipped()
                    .cornerRadius(150)
                    .shadow(radius: 5)
                
                Text(user.Username)
                    .font(.title).bold()
                    .fontWeight(.medium)
                
             
            }
            
            Spacer()
            Form{
                Section{
                    HStack{
                        VStack{
                            Button(action: {
                                print("nzeelt")
                            }) {
                                Image("donate")
                                Text("Donas")
                                
                            }
                        }
                        Spacer()
                        VStack{
                            Button(action: {
                                print("nzeelt")
                            }) {
                                Image("calendar")
                                Text("Event")
                                
                            }
                        }
                        
                        Spacer()
                        VStack{
                            Button(action: {
                                print("nzeelt")
                            }) {
                                Image("chat")
                                Text("Chats")
                                
                            }
                        }
                        
                        
                        
                        
                    }
                }
                
                Section{
                    HStack{
                        Text("FullName")
                        Spacer()
                        Text(user.fullname)
                            .foregroundColor(.gray)
                    }.padding()
                    HStack{
                        Text("Email")
                        Spacer()
                        Text(user.Email)
                            .foregroundColor(.gray)
                    }.padding()
                    HStack{
                        Text("Phone")
                        Spacer()
                        Text(user.Phone)
                            .foregroundColor(.gray)
                        
                    }.padding()
                
                }
                

                
            }
                
        
            
        
            
        }
        

    
        
        
        
       
        
    }
    
}

struct ProfileUser_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUser(user: user1)
            .padding(.top, 40)
            
    }
}
