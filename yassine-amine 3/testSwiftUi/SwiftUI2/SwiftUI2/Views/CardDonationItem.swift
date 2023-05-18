//
//  CardDonationItem.swift
//  SwiftUI2
//
//  Created by Mac Mini 10 on 29/3/2023.
//

import SwiftUI

struct CardDonationItem: View {
    
    @State var title: String = "yassine"
    @State var type: String = "yassine"
    @State var description: String = "yassine"

    

    var body: some View {
        VStack{
            
            HStack{
                
                Text("Title :")
                
                Spacer().frame(width: 25)
                
                Text(title)
                
                
                }
            
            
            HStack{
                
                Text("Type Donation :")
                
                Spacer().frame(width: 25)
                
                Text(type)
                
            }
            
            
            VStack{
                Text("Description :")
                Spacer().frame(height: 0)
                Text(description)
                
            }
            
        }
        .background(Color(red: 0.7529411764705882, green: 0.9647058823529412, blue: 0.9529411764705882))
    }
}

struct CardDonationItem_Previews: PreviewProvider {
    static var previews: some View {
        CardDonationItem()
        .previewLayout(.sizeThatFits)

    }
}
