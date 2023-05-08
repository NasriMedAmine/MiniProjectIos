//
//  CardUserItem.swift
//  SwiftUI2
//
//  Created by Mac Mini 11 on 30/3/2023.
//

import SwiftUI

struct CardUserItem: View {
    
    let user : UserYassine
    var body: some View {
       
        VStack{
            
            HStack{
                
                ZStack{
                    Image("sfax")
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .cornerRadius(50)
                }
                
                VStack{
                    Text(user.name)
                        .font(.title).bold()
                    
                }
            }
            .padding(5)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .shadow(radius: 5)
            

        }
        .frame(maxWidth: .infinity)
        .background(Color(red: 0.7529411764705882, green: 0.9647058823529412, blue: 0.9529411764705882))
        .cornerRadius(15)
        .shadow(radius: 5)
            
        
        
    }
}

struct CardUserItem_Previews: PreviewProvider {
    static var previews: some View {
        CardUserItem(user: UserYassine(id: "4444", name: "yassine", username: "yassine", email: "yassine", password: "yassine", tel: 44444, photoName: "logo.png"))
            .previewLayout(.sizeThatFits)
        
        
            


    }
}
