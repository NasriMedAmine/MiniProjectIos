//
//  DetailsEvents.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 7/5/2023.
//


import SwiftUI
import MapKit
import CoreLocation


struct DetailsEvents: View {
    let city: City
    
    
    var body: some View {
        VStack {
            Text(city.name)
                        .font(.custom("Arial", size: 28))
                        .fontWeight(.bold)
                        .padding(.top, 50) // Add some space at the top
            Image(uiImage: city.image!)
                    .resizable()
                    .frame(width: 350, height: 200)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                    // Rest of the view content goes here
            Text("Event Price")
            Text("\(city.price) Dt")
            Spacer()
            Text(city.description)
                    .font(.system(size: 18))
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20)
                
                Spacer()
            
                }
    
        
        
       
        
        
    }
}

struct DetailsEvents_Previews: PreviewProvider {
    static var previews: some View {
        DetailsEvents(city: City(name: "Kairouan", coordinate: CLLocationCoordinate2D(latitude: 35.6781, longitude: 10.0964),
                                 description: "A vibrant and diverse city known for its history, culture, and entertainment.",
                                 price: 123,
                                 date: Date(),
                                 image: UIImage(named: "london.jpg")))
    }
}
