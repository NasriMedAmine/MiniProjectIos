//
//  AddDonation.swift
//  SwiftUI2
//
//  Created by Mac Mini 10 on 29/3/2023.
//

import SwiftUI
import Alamofire

struct AddDonation: View {
    
    @State private var text = "Add donation description"
    @State
    private var name = ""
    @State
    private var description = ""
    
    @State private var showAlert = false

  
    
    @State var isCheckedFood: Bool = false
    @State var isCheckedClothes: Bool = false
    @State var isCheckedMoney: Bool = false
    @State var isCheckedOther: Bool = false
    
    
    @State private var showDetail = false // state variable to track whether to show detail screen

    
    var body: some  View {
        NavigationView {

        ZStack {
            
            VStack {
                
                //awel wahda mtaa AddDonation text
                ZStack {
                    // Background image
                                Image("donationhand")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .edgesIgnoringSafeArea(.all)
                                .frame(width: 400)
                                
                                
                    
                    Text("Add Donation")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding()
                        .font(.title)
                        .layoutPriority(1)
                        .foregroundColor(Color.white)
                        .padding(.top, 120)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .background(Color(red: 0.11372549019607843, green: 0.7176470588235294, blue: 0.6823529411764706))
                .clipShape(RoundedCorner(radius: 30, corners: [.bottomLeft, .bottomRight]))
                
         
                

                
                
         
                
                
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
                .shadow(radius: 5)
                
                
                Spacer().frame(height: 30)
                
                
               
                
                TextField("Add donation name" ,text: $name)
                    .padding()
                    .background(Color(red: 0.7529411764705882, green: 0.9647058823529412, blue: 0.9529411764705882))
                    .cornerRadius(110.0)
                    .frame(width: 350.0)
                    .shadow(radius: 5)
                
                Spacer().frame(height: 40)
                
                
                TextField("Add donation description" ,text: $description)
                    .frame(width: 320,height: 100)
                    .padding()
                    .background(Color(red: 0.7529411764705882, green: 0.9647058823529412, blue: 0.9529411764705882))
                    .cornerRadius(30)
                    .shadow(radius: 5)
                    
                
                
                
                Spacer().frame(height: 22)

                VStack {
                    HStack{
                        
                        Button(action: {
                            addDonation()
                            
                            self.showAlert = true
                        }) {
                            Text("Submit")
                                .frame(width: 100)
                            
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(red: 0.11372549019607843, green: 0.7176470588235294, blue: 0.6823529411764706))
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                        }
                        .alert(isPresented: $showAlert) {
                            let text = "donation was added successfully"
                            
                            
                            return Alert(title: Text("donation Added"), message: Text(text), dismissButton: .default(Text("OK")))
                                }
                        
                        Spacer().frame(width: 22)
                       
                        
                        
                        Button(action: {
                            print("nzeelt")
                            name = ""
                            description = ""
                            
                        }) {
                            Text("Reset")
                                .frame(width: 100)
                            
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(red: 0.11372549019607843, green: 0.7176470588235294, blue: 0.6823529411764706))
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                        }
                    }
                    Spacer().frame(height: 10)
                    ZStack{
                        NavigationLink(destination: ListDonations(), isActive: $showDetail) {
                                            EmptyView()
                                        }
                        Button(action: {
                            print("nzeelt")
                            showDetail = true // set showDetail to true to activate NavigationLink and show DetailScreen
                        }) {
                            Text("List Donations")
                                .frame(width: 250)
                            
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(red: 0.11372549019607843, green: 0.7176470588235294, blue: 0.6823529411764706))
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                        }
                    }
                    Spacer()

                    
                    
                }
                
            }
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.8980392156862745, green: 0.9882352941176471, blue: 0.984313725490196)/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
            
            
        }            .ignoresSafeArea()

        }
        
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
    
    
    
    func addDonation() {
        let endpointURL = "http://localhost:3007/donation/"
        
        var typeDonation: [String] = []
        if isCheckedClothes {
            typeDonation.append("Clothes")
        }
        if isCheckedFood {
            typeDonation.append("Food")
        }
        if isCheckedOther {
            typeDonation.append("Other")
        }
        if isCheckedMoney {
            typeDonation.append("Money")
        }
        
        let parameters: [String: Any] = [
            "titre": name,
            "typedonation" : typeDonation,
            "description" : description,
        ]
        
        AF.request(endpointURL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success(let data):
                print("Donation added successfully")
                
                
            case .failure(let error):
                print("Error adding donation: \(error.localizedDescription)")
            }
        }
    }
    
    
    
    
    
    struct AddDonation_Previews: PreviewProvider {
        static var previews: some View {
            AddDonation()
        }
    }
    
}
