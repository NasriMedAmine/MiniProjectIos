//
//  TestNav.swift
//  SwiftUI2
//
//  Created by Mac Mini 10 on 30/3/2023.
//

import SwiftUI


import Alamofire







struct TestNav: View {
    var body: some View {
        NavigationView {
                    VStack {
                        NavigationLink(destination: ListDonations()) {
                            Text("Go to Other View")
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .navigationTitle("Main View")
                }
    }
        
}

struct TestNav_Previews: PreviewProvider {
    static var previews: some View {
        TestNav()
    }
}

func fetshData(){
    
    
    AF.request("http://localhost:3007/donation/").responseJSON { response in
        switch response.result {
        case .success(let value):
            // Manipulate the response data here
            print(value)
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
}



