//
//  ModelListUser.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 2/5/2023.
//
import SwiftUI
import Alamofire
import SwiftyJSON
import MapKit
import CoreLocation





class ModelListUser: ObservableObject {
    @Published var listCardUserItem: [UserYassine] = []

    @Published var listCardDonation: [Donation] = []

    @Published var listMapLocation: [MapLocationTest] = []
    
    
    @Published var listMapLocationCity: [City] = []


    
    
    
     func fetchDonations() {
        AF.request("http://localhost:3007/donation/").responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonRes = JSON(data)
                    
                    print("---------------------------------------------------------")
                    print("---------------------------------------------------------")
                    
                    
                    print(jsonRes)
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let donations = try decoder.decode([Donation].self, from: data)
                    //print(listCardUserItem)
                    DispatchQueue.main.async {
                                            self.listCardDonation = donations
                        
                        
                                        }
                    
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    
    func fetshDataLocation() {
        AF.request("http://localhost:3007/user/getAllMap",method: .get).responseData { response in
           switch response.result {
           case .success(let data):
               do {
                   let jsonRes = JSON(data)
                   
                   print("---------------------------------------------------------")
                   print("---------------------------------------------------------")
                   
                   
                   print(jsonRes)
                   let decoder = JSONDecoder()
                   decoder.keyDecodingStrategy = .convertFromSnakeCase
                   let MapLocationS = try decoder.decode([MapLocationTest].self, from: data)
                   //print(listCardUserItem)
                   DispatchQueue.main.async {
                       self.listMapLocation = MapLocationS
                       
                       
                           for location in self.listMapLocation {
                               print(location)
                               
                               let cityFinal = City(name: location.name,
                                                    coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(location.latitude), longitude: CLLocationDegrees(location.longitude)),
                                                    description: location.description,
                                                    price: Int(location.price),
                                                    date: Date(),
                                                    image: UIImage(named: location.nameImage))
                               
                               self.listMapLocationCity.append(cityFinal)
                               
                           }
                       }
                   
               } catch {
                   print(error)
               }
           case .failure(let error):
               print(error)
           }
       }
   }
    
    
    
    
    
    
    func fetchUser() {
        AF.request("http://localhost:3007/user/",method: .get).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonRes = JSON(data)
                    
                    print("---------------------------------------------------------")
                    print("---------------------------------------------------------")
                    
                    
                    print(jsonRes)
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let users = try decoder.decode([UserYassine].self, from: data)
                    //print(listCardUserItem)
                    DispatchQueue.main.async {
                                            self.listCardUserItem = users
                                        }
                    
                    
                    
                    
                    print("---------------------------------------------------------")
                    print("---------------------------------------------------------")
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
