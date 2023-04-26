//
//  User.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 30/3/2023.
//

import Foundation



struct UserJson: Codable,Hashable {
    let name: String
    let email: String
    let password : String
    let token : String
    
}
