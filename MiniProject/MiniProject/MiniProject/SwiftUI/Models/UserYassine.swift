//
//  User.swift
//  SwiftUI2
//
//  Created by Mac Mini 11 on 30/3/2023.
//

import Foundation


struct UserYassine: Codable, Identifiable {
    let id: String
    let name: String
    let username: String
    let email: String
    let password : String
    let tel : Int
    let photoName : String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case username
        case email
        case password
        case tel
        case photoName
    }
}



struct UserYassine2:Codable {
    let username: String
    
    
    enum CodingKeys: String, CodingKey {
            case username = "name"
        }
    
}





struct MapLocationTest:Codable {
    let name: String
    let nameImage: String
    let description: String


    let latitude: Float
    let longitude: Float
    let price: Float

    enum CodingKeys: String, CodingKey {
            case name = "name"
            case nameImage = "nameImage"
            case description = "description"
            case latitude = "latitude"
            case longitude = "longitude"
            case price = "price"
        }
    
    

    
    
}

