//
//  Donation.swift
//  SwiftUI2
//
//  Created by Mac Mini 9 on 30/3/2023.
//

import Foundation

struct Donation: Codable, Identifiable {
    let id: String

    let titre: String
    let typedonation: [String]
    let description: String
    
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case description
        case typedonation
        case titre
        
    }
}
