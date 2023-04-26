//
//  AddDonation.swift
//  SwiftUI2
//
//  Created by Mac Mini 10 on 29/3/2023.
//

import SwiftUI
import Alamofire
import SwiftyJSON



struct AddDonation: View {
    
    
    @State private var name = ""
    @State private var description = ""
    
    @State var isCheckedFood: Bool = false
    @State var isCheckedClothes: Bool = false
    @State var isCheckedMoney: Bool = false
    @State var isCheckedOther: Bool = false
    
    
    
    @State var showAlert = false

    
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                VStack {
                    
                    
                    //awel wahda mtaa AddDonation text
                    ZStack {
                        Text("Add Donation")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding()
                            .font(.title)
                            .layoutPriority(1)
                        
                    }
                    //.onAppear(perform: fetshData)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.11372549019607843, green: 0.7176470588235294, blue: 0.6823529411764706))
                    .clipShape(RoundedCorner(radius: 30, corners: [.bottomLeft, .bottomRight]))
                    
                    
                    
                    Spacer()
                        .frame(height: 30)
                    
                    
                    //hedhi mtaa type donation
                    VStack {
                        Text("Type Donation")
                            .font(.title)
                            .padding()
                        
                        VStack {
                            HStack{
                                
                                
                                
                                
                                Checkbox(isChecked: $isCheckedFood)
                                
                                Text("Food")
                                Spacer().frame(width: 80)
                                
                                
                                
                                
                                Checkbox(isChecked: $isCheckedClothes)
                                Text("Clothes")
                                
                                
                            }
                            
                            HStack{
                                Checkbox(isChecked: $isCheckedMoney)
                                Text("Money")
                                
                                
                                Spacer().frame(width: 80)
                                
                                
                                
                                Checkbox(isChecked: $isCheckedOther)
                                Text("Other")
                                
                                
                            }
                            
                        }
                        .padding()
                        
                    }
                    .frame(width: 350.0)
                    .background(Color(red: 0.7529411764705882, green: 0.9647058823529412, blue: 0.9529411764705882))
                    .cornerRadius(30.0)
                    
                    
                    Spacer().frame(height: 30)
                    
                    
                    //hedhi input
                    
                    TextField("Name Event" ,text: $name)
                        .padding()
                        .background(Color(red: 0.7529411764705882, green: 0.9647058823529412, blue: 0.9529411764705882))
                        .cornerRadius(110.0)
                        .frame(width: 350.0)
                    
                    Spacer().frame(height: 40)
                    
                    
                    TextField("Name Event" ,text: $description)
                        .frame(width: 320,height: 200)
                        .padding()
                        .background(Color(red: 0.7529411764705882, green: 0.9647058823529412, blue: 0.9529411764705882))
                        .cornerRadius(50)
                    
                    
                    
                    Spacer()
                    
                    VStack {
                        HStack{
                            Button(action: {
                                onClickSubmit()
                            }) {
                                Text("Submit")
                                    .frame(width: 100)
                                
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color(red: 0.11372549019607843, green: 0.7176470588235294, blue: 0.6823529411764706))
                                    .cornerRadius(10)
                                
                            }
                            
                            Spacer().frame(width: 22)
                            
                            
                            Button(action: {
                                print("nzeelt")
                            }) {
                                Text("Reset")
                                    .frame(width: 100)
                                
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color(red: 0.11372549019607843, green: 0.7176470588235294, blue: 0.6823529411764706))
                                    .cornerRadius(10)
                                
                            }
                        }
                        
                        ZStack{
                            
                            
                            
                            
                            VStack {
                                NavigationLink(destination: ListDonations()) {
                                    Text("List Donations")
                                        .frame(width: 250)
                                    
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color(red: 0.11372549019607843, green: 0.7176470588235294, blue: 0.6823529411764706))
                                        .cornerRadius(10)
                                }
                                
                            }
                            
                            //
                            //
                            //
                            //                        Button(action: {
                            //                            print("nzeelt")
                            //
                            //                        })
                            //
                            //
                            //                        {
                            //                            Text("Liste of Donations")
                            //                                .frame(width: 250)
                            //
                            //                                .fontWeight(.bold)
                            //                                .foregroundColor(.white)
                            //                                .padding()
                            //                                .background(Color(red: 0.11372549019607843, green: 0.7176470588235294, blue: 0.6823529411764706))
                            //                                .cornerRadius(10)
                            //
                            //                        }
                            //
                            //
                            //                    }
                            //                    .navigationTitle("My App")
                        }
                        
                        
                    }
                    
                }
                .background(Color(red: 0.8980392156862745, green: 0.9882352941176471, blue: 0.984313725490196))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Post Request Done!"), message: Text("Your request was successful."), dismissButton: .default(Text("OK")))
                }
                
                
                
                
                
                
            }
            //.navigationTitle("My App")
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    func onClickSubmit(){
        
        
        
        var listChecked = [String]()
        
        
        
        
        
        
        
        
        //-------------------------------------------
        
        if(isCheckedFood){
            listChecked.append("Food")
        }
        if(isCheckedMoney){
            listChecked.append("Money")

        }
        if(isCheckedClothes){
            listChecked.append("Clothes")

        }
        if(isCheckedOther){
            listChecked.append("Other")

        }
        
        
        
        let parameters: Parameters = [
            "title": name,
            "typedonation": listChecked,
            "description": description,

        ]
        
        
        
        AF.request("http://localhost:3007/donation/", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .response { response in
                // Check for an error
                guard response.error == nil else {
                    // Handle the error
                    return
                }
                
                print("*---------------------------------------------------")
                print(response)
                
                print("*---------------------------------------------------")
                // Show a pop-up message to the user
                showAlert = true
            }
        
        
        
        //-------------------------------------------
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    struct RoundedCorner: Shape {
        var radius: CGFloat
        var corners: UIRectCorner
        
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(
                roundedRect: rect,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius)
            )
            return Path(path.cgPath)
        }
    }
    
    
    
    
    
    
    
    
    
    struct CheckboxListItem: View {
        let title: String
        @Binding var isChecked: Bool
        
        var body: some View {
            HStack {
                Text(title)
                Spacer()
                Checkbox(isChecked: $isChecked)
            }
            .padding()
        }
    }
    
    struct Checkbox: View {
        @Binding var isChecked: Bool
        
        var body: some View {
            Button(action: {
                self.isChecked.toggle()
            }) {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}



struct AddDonation_Previews: PreviewProvider {
    static var previews: some View {
        AddDonation()
    }
}






