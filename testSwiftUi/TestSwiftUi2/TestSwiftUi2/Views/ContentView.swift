//
//  ContentView.swift
//  TestSwiftUi2
//
//  Created by Mac Mini 10 on 28/3/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View{
//        Text("Hello World")
//            .font(.title)
//            .padding()
        
        
        VStack(alignment: .leading, spacing: 26.0){
            Text("message1")
                .font(.title)
            HStack{
                Text("Message2")
                    .font(.subheadline)
                
                Spacer()
                
                Text("Message3")
            }
            
            
        }
    }
    
}



struct ContentView_Pre : PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
