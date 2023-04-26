//
//  ListDonations.swift
//  SwiftUI2
//
//  Created by Mac Mini 10 on 30/3/2023.
//

import SwiftUI

struct ListDonations: View {
    var body: some View {
        
        ZStack{
            List{
                CardDonationItem(donation: donation2)
                    .listRowSeparator(.hidden)
                CardDonationItem(donation: donation2)
                    .listRowSeparator(.hidden)
            }
            
        }
        .listStyle(.plain)
       
        
        
        
    }
}


struct ListDonations_Previews: PreviewProvider {
    static var previews: some View {
        ListDonations()
    }
}


