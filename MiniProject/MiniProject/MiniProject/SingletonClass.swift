//
//  SingletonClass.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 10/4/2023.
//

import UIKit

class SingletonClass: NSObject {

    
    static let shared = SingletonClass()
    
    
    var emailUser: String = ""
    var nameUser: String = ""
    var token: String = ""
    
    
    var isContainerPasswordForget: Bool = false
    
    var isSayeKamelLocation: Bool = false

    var latitude: Double = 0
    var longitude: Double = 0

    private override init() {}
}
