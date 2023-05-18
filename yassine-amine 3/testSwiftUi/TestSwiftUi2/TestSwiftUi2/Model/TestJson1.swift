//
//  TestJson1.swift
//  TestSwiftUi2
//
//  Created by Mac Mini 10 on 28/3/2023.
//

import Foundation
import SwiftUI
import CoreLocation



struct TestJson1 : Hashable,Codable{
    
    var id : Int
    var name : String
    var email : String
    
    private var imageName : String
    var image : Image {
        Image(imageName)
    }
    
    
    struct Coordinate : Hashable , Codable {
        var latitude : Double
        var longitude : Double
    }
    
    private var coordinates : Coordinate
    
    var locationCor : CLLocationCoordinate2D{
        
        CLLocationCoordinate2D(
            latitude: coordinates.latitude, longitude: coordinates.longitude
        )
    }
}
