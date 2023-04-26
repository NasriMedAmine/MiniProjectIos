//
//  ListDonations.swift
//  SwiftUI2
//
//  Created by Mac Mini 10 on 30/3/2023.
//


import SwiftUI
import Alamofire
import SwiftyJSON





struct ListDonations: View {
    
    @State private var items = ["Item 1","Item 1","Item 1","Item 1","Item 1","Item 1","Item 1", "Item 2", "Item 3"]

    @State private var listOfDonations = [DonationJSON]()

    
    var body: some View {
        
        ZStack{
            
            List {
                        ForEach(listOfDonations, id: \.self) { item in
                            HStack {
                                CardDonationItem(title: item.title,
                                                 type: item.description,

                                                 description: item.type
                                                 )
                                    .padding(/*@START_MENU_TOKEN@*/.top, 17.0/*@END_MENU_TOKEN@*/)
                                    .listRowSeparator(.hidden)
                                
                            }
                            //Spacer().background(.opacity(0))
                        }
            }
            .onAppear(perform: fetshData)
            .frame(height: 350)
            .listStyle(.plain)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/)
            .padding(/*@START_MENU_TOKEN@*/.all, 50.0/*@END_MENU_TOKEN@*/)

            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.8980392156862745, green: 0.9882352941176471, blue: 0.984313725490196)/*@END_MENU_TOKEN@*/)
        

        
        

       
    }
    
    
    
    
    
    func fetshData(){
        
        
        AF.request("http://localhost:3007/donation/").responseJSON { response in
            switch response.result {
            case .success(let value):
                // Manipulate the response data here
                //print(value)
                
                let json = JSON(value)
                
                
                      
                
                
                print(json.type)
                print("-----------------------------------------------------------------------")
                print(json.count)
                print("-----------------------------------------------------------------------")

                print(json[0])
                print("-----------------------------------------------------------------------")

                print(json[0].type)
                print("-----------------------------------------------------------------------")

                print(json[0]["titre"])
                print("-----------------------------------------------------------------------")
                
                
                for itemDonation in json {
                    

                    var typeFinal = ""

                    for typeDonationFor in itemDonation.1["typedonation"] {
                        typeFinal = typeFinal + (typeDonationFor.1.string ?? "eddd")
                    }
                    
                    
                    
                    var donation = DonationJSON(
                        title: itemDonation.1["titre"].rawValue as! String,
                        type: itemDonation.1["description"].rawValue as! String,
                        description: typeFinal
                    )

                    listOfDonations.append(donation)

//
//                    print(itemDonation.1["typedonation"])
//                    print(itemDonation.1["typedonation"])
//                    print(itemDonation.1["typedonation"].type)
                    
                    
                }
                
                
                
                print("kamlt list")
                print(listOfDonations)
                
                
                
                
                
                
                

                
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }

    
    
    
}












struct ListDonations_Previews: PreviewProvider {
    static var previews: some View {
        ListDonations()
    }
}


