//
//  CardMapImage.swift
//  TestSwiftUi2
//
//  Created by Mac Mini 10 on 28/3/2023.
//

import SwiftUI

struct CardMapImage: View {
    var body: some View {
        VStack{
            
            MapTest()
                .frame(height: 300)
                    
            //Spacer(minLength: 50)
            
            Com1()
                .offset(y : -130)
            
            VStack(alignment: .leading, spacing: 6.0){
                
                Text("message1")
                
                Divider()
                Text("message2")
                    .foregroundColor(.secondary)
                Divider()
                Divider()
                //Spacer()
                //Spacer()
                
                
                
            }
            .padding()
            
            
        }
    }
}

struct CardMapImage_Previews: PreviewProvider {
    static var previews: some View {
        CardMapImage()
    }
}
