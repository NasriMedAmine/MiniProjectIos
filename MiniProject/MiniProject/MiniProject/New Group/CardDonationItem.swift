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
                
            Spacer().frame(height: 15)
            HStack {
                Spacer().frame(width: 15)
                Image("donation")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                
                Spacer().frame(width: 75)
                
                Text(donation.titre)
                    .font(.system(size: 24))
                
                
                }
                Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 30)
            Spacer().frame(height: 15)
            HStack{
                Spacer().frame(width: 15)
                Text("Type Donation :")
                    .font(.system(size: 24))
                
                Spacer().frame(width: 25)
                
                Text(donation.typedonation.joined(separator: ", "))
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
                            .font(.custom("Didot", size: 20))
                                .foregroundColor(.gray)
                        
                    }
                }
            
                Spacer().frame(height: 15)
            
        }
        .background(Color(.tertiarySystemFill))
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 10)
        
        
        
    }
}


struct CardDonationItem_Previews: PreviewProvider {
    static var previews: some View {
        CardDonationItem(donation: Donation(id:"444",titre: "test", typedonation:["test1","test2"] , description: "testestetstststsduqsdqs"))
    }
}
