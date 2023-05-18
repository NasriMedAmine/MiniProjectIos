//
//  SingletonClass.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 10/4/2023.
//

import UIKit

class SingletonClass: NSObject,ObservableObject {

    
    static let shared = SingletonClass()
    
    
    var emailUser: String = ""
    var nameUser: String = ""
    var token: String = ""
    
    
    
    var NameToEventItem : String = ""
    var LatiToEventItem : String = ""
    var LongToEventItem : String = ""
    var descriptionToEventItem : String = ""
    var priceToEventItem : Int = 0
    
    
    
    
    
    
    
    
    @Published var isThatProfileConnRes: Bool = false
    
    @Published var isThatProfileConnResToHeader: Bool = false
    
    @Published var isThatProfileConnResToHeaderMakeLogOut: Bool = false

    
    var isContainerPasswordForget: Bool = false
    
    var isSayeKamelLocation: Bool = false

    var latitude: Double = 0
    var longitude: Double = 0

    
    
    var nameUserIsConNotME: String = ""

    private override init() {}
}
