//
//  CardDonationItem.swift
//  SwiftUI2
//
//  Created by Mac Mini 10 on 29/3/2023.
//

import SwiftUI

struct CardDonationItem: View {
    let donation: Donation
    
    var body: some View {
            VStack(alignment: .leading){
                ZStack{
                    Image(donation.photo)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(height: 80)
                        .clipped()
                }
            Spacer().frame(height: 15)
            HStack {
                Spacer().frame(width: 15)
                Text("Title :")
                    .font(.system(size: 24))
                
                Spacer().frame(width: 25)
                
                Text(donation.title)
                    .font(.system(size: 24))
                
                
                }
            
            Spacer().frame(height: 15)
            HStack{
                Spacer().frame(width: 15)
                Text("Type Donation :")
                    .font(.system(size: 24))
                
                Spacer().frame(width: 25)
                
                Text(donation.typeDonation)
                    .font(.system(size: 24))
                
            }
            
            Spacer().frame(height: 15)
                
                HStack{
                    Spacer().frame(width: 15)
                    VStack(alignment: .leading){
                        
                        Text("Description :")
                            .font(.system(size: 24))
                        Spacer().frame(height: 10)
                        Text(donation.description)
                            .font(.system(size: 24))
                        
                    }
                }
            
                Spacer().frame(height: 15)
            
        }
        .background(Color(.tertiarySystemFill))
        .background(Color(red: 0.7529411764705882, green: 0.9647058823529412, blue: 0.9529411764705882))
        .cornerRadius(12)
        .shadow(radius: 5)
        
        
        
    }
}

struct CardDonationItem_Previews: PreviewProvider {
    static var previews: some View {
        CardDonationItem(donation: donation2)
            .previewLayout(.sizeThatFits)
            .background(Color(red: 0.7529411764705882, green: 0.9647058823529412, blue: 0.9529411764705882))

    }
}
