//
//  UpdateDonation.swift
//  SwiftUI2
//
//  Created by Mac Mini 10 on 29/3/2023.
//

import SwiftUI

struct UpdateDonation: View {
    @State
    private var nameUpdate = ""
    @State
    private var descriptionUpdate = ""
    
    @State var isCheckedFoodUpdate: Bool = false
    @State var isCheckedClothesUpdate: Bool = false
    @State var isCheckedMoneyUpdate: Bool = false
    @State var isCheckedOtherUpdate: Bool = false

    var body: some View {
        ZStack {
            
            VStack {
                
                
                //awel wahda mtaa AddDonation text
                ZStack {
                    Text("Update Donation")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding()
                        .font(.title)
                        .layoutPriority(1)
                        
                }
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
                                    
                                    
                                    
                                    
                                    CheckboxUpdate(isChecked: $isCheckedFoodUpdate)
                                    

                                    Text("Food")
                                    Spacer().frame(width: 80)
                                    
                                    
                                    
                                    
                                    CheckboxUpdate(isChecked: $isCheckedClothesUpdate)
                                    Text("Clothes")

                                    
                                }
                                
                                HStack{
                                    CheckboxUpdate(isChecked: $isCheckedMoneyUpdate)
                                    Text("Money")

                                    
                                    Spacer().frame(width: 80)
                                    
                                    
                                    
                                    CheckboxUpdate(isChecked: $isCheckedOtherUpdate)
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
                
                
                //hedhi input
                
                TextField("Update donation name" ,text: $nameUpdate)
                    .padding()
                    .background(Color(red: 0.7529411764705882, green: 0.9647058823529412, blue: 0.9529411764705882))
                    .cornerRadius(110.0)
                    .frame(width: 350.0)
                    .shadow(radius: 5)
                
                
                Spacer().frame(height: 40)

                
                TextField("Update donation description" ,text: $descriptionUpdate)
                    .frame(width: 320,height: 200)
                    .padding()
                    .background(Color(red: 0.7529411764705882, green: 0.9647058823529412, blue: 0.9529411764705882))
                    .cornerRadius(30)
                    .shadow(radius: 5)
                    
                
                
                Spacer()
                
                VStack {
                    HStack{
                        Button(action: {
                            print("nzeelt")
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
                                .shadow(radius: 5)
                            
                        }
                    }
                    
                    ZStack{
                        Button(action: {
                            print("nzeelt")
                        }) {
                            Text("Liste of Donations")
                                .frame(width: 250)

                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(red: 0.11372549019607843, green: 0.7176470588235294, blue: 0.6823529411764706))
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                        }
                        
                        
                        
                        

                        
                    }
                }

                
            }
            
        }
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.8980392156862745, green: 0.9882352941176471, blue: 0.984313725490196)/*@END_MENU_TOKEN@*/)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        
        
        
        
        
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


struct CheckboxListItemUpdate: View {
    let title: String
    @Binding var isChecked: Bool
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            CheckboxUpdate(isChecked: $isChecked)
        }
        .padding()
    }
}




struct CheckboxUpdate: View {
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




struct UpdateDonation_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDonation()
    }
}
