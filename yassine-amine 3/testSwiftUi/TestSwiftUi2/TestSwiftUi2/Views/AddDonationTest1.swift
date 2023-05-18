//
//  AddDonationTest1.swift
//  TestSwiftUi2
//
//  Created by Mac Mini 10 on 29/3/2023.
//

import SwiftUI





//
//extension ColorTest1 {
//    init(hex: String) {
//        let scanner = Scanner(string: hex)
//        var rgbValue: UInt64 = 0
//        scanner.scanHexInt64(&rgbValue)
//
//        let r = Double((rgbValue & 0xff0000) >> 16) / 255.0
//        let g = Double((rgbValue & 0xff00) >> 8) / 255.0
//        let b = Double(rgbValue & 0xff >> 16) / 255.0
//
//        self.init(red: r, green: g, blue: b)
//    }
//}




struct AddDonationTest1: View {
    
    @State private var name = ""
    @State private var location = ""
    @State private var price = ""
    @State private var descriptfion = ""
    @State private var date = Date()
    
    
    
    
    
    
    
    
    var body: some View {
        
        VStack{
            TextField("Name Event" ,text: $name)
                .padding()
                .background(Color.red.opacity(0.9))
                .cornerRadius(/*@START_MENU_TOKEN@*/110.0/*@END_MENU_TOKEN@*/)
            
            Spacer().frame(height: 20)
            
            TextField("location" ,text: $location)
                .padding()
                .background(Color.red.opacity(0.9))
                .cornerRadius(/*@START_MENU_TOKEN@*/110.0/*@END_MENU_TOKEN@*/)
            
            Spacer().frame(height: 20)
            
            
//            DatePicker("select date",selection: $date,displayedComponents: .date)
//                .datePickerStyle(.graphical)
//                .padding()
//
//            Spacer().frame(height: 20)
            
            
            
            TextField("price" ,text: $price)
                .padding()
                .background(Color.red.opacity(0.9))
                .cornerRadius(/*@START_MENU_TOKEN@*/110.0/*@END_MENU_TOKEN@*/)
            
            Spacer().frame(height: 20)
            
            TextEditor(text: $descriptfion)
                .padding()
                .background(Color.red.opacity(0.9))
            
                .frame(height: 200)
            
            Spacer().frame(height: 20)
            
//            
//            Button("send"){
//                sendRequest()
//            }
            
        }
            
            
            
            
            
        
        //.background(Color(hex: "E5FCFB"))
        
        
        
        
        
    }
//
//    func sendRequest(){
//        let parameters =  ["name" : name,
//                           "lieu" : location,
//                           "prix" : Int(price)
//                           "date_event" : nil,
//                           "description" : descriptfion
//        ] as [String : Any?]
//
//
//
//    }
}





extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = Double((rgbValue & 0xff0000) >> 16) / 255.0
        let g = Double((rgbValue & 0xff00) >> 8) / 255.0
        let b = Double(rgbValue & 0xff >> 16) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}

struct AddDonationTest1_Previews: PreviewProvider {
    static var previews: some View {
        AddDonationTest1()
    }
    
}



