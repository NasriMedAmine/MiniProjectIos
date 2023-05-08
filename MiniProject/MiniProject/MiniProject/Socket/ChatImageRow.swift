//
//  ChatImageRow.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 1/5/2023.
//

import SwiftUI
//import URLImage






struct ChatMessage2 : Hashable {
    var NameImage: String
}



struct ChatImageRow: View {
    var chatMessage: ChatMessage2
    
    
    
        
    
    let url = URL(string: "http://localhost:3007/name")
    
    // body - is the body of the view, just like the body of the first view we created when opened the project
    var body: some View {
        // HStack - is a horizontal stack. We let the SwiftUI know that we need to place
        // all the following contents horizontally one after another
                    Image("login_photo 1")

        
//        URLImage(url: url!, failure: { error, _ in
//            Image("login_photo 1")
//        }, content: { image in
//            image
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .clipShape(Circle())
//                .overlay(Circle().stroke(Color.gray, lineWidth: 4))
//                .shadow(radius: 7)
//        })

        
        
        }

    }


struct ChatImageRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatImageRow(chatMessage: ChatMessage2(NameImage: "name"))
    }
}
