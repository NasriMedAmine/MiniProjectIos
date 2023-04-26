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
    
    
    private override init() {}
}
