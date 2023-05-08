//
//  ListDonations.swift
//  SwiftUI2
//
//  Created by Mac Mini 10 on 30/3/2023.
//

import SwiftUI
import Alamofire

struct ListDonations: View {
    @State var donations: [Donation] = []
    
    @StateObject private var viewModel = ModelListUser()

        
        var body: some View {
    
                ZStack{
                       List(viewModel.listCardDonation) { donation in
                        CardDonationItem(donation: donation)                    }
                    
                    
                    
                }
                .listStyle(.plain)
                .onAppear {
                    viewModel.fetchDonations()
                }
//                List(donations, id: \.title) { donation in
//                    CardDonationItem(donation: donation)
//                }
//                .listStyle(.plain)
//                .navigationBarTitle("Donations")
                
                
                
            }
            
        
        
        
}


struct ListDonations_Previews: PreviewProvider {
    static var previews: some View {
        ListDonations()
    }
}


