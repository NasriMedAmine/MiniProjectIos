//
//  MapForEvent.swift
//  MiniProject
//
//  Created by Mac Mini 10 on 8/5/2023.
//


import SwiftUI
import MapKit
import CoreLocation

import Alamofire
import SwiftyJSON



struct MapForEvent: View {
    //    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    
    
    
    
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.0205, longitude: 6.7335), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    @State private var userTrackingMode: MKUserTrackingMode = .follow
    
    @State private var selectedAnnotation: City?
    
    let annotations2 = [
        City(name: "London",
                          coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
                          description: "A vibrant and diverse city known for its history, culture, and entertainment.",
                          price: 123,
                          date: Date(),
                          image: UIImage(named: "london.jpg")),
        
    ]
    
    
    
    
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Map(coordinateRegion: $region, annotationItems: annotations2) { city in
                MapAnnotation(coordinate: city.coordinate) {
                    CityAnnotation(city: city)
                        .onTapGesture {
                            selectedAnnotation = city

                        }
                }
            }
//            .onTapGesture(count: 2) {
//                        let location = $0.location
//                        let coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
//                        print("Double-clicked at: \(coordinate)")
//                    }
            
            
            
            
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Map")
            .navigationBarItems(trailing:
                Button(action: {
                    selectedAnnotation = nil
                }, label: {
                    Text("Back")
                })
                .disabled(selectedAnnotation == nil)
            )

//
            
                        
            
            
            
            
            
            
            VStack {
                Button(action: {
                    region.span = MKCoordinateSpan(latitudeDelta: min(region.span.latitudeDelta * 2, 180), longitudeDelta: min(region.span.longitudeDelta * 2, 180))
                }) {
                    Image(systemName: "minus")
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .clipShape(Circle())
                }
                .padding(.trailing)
                
                Button(action: {
                    region.span = MKCoordinateSpan(latitudeDelta: max(region.span.latitudeDelta / 2, 0.01), longitudeDelta: max(region.span.longitudeDelta / 2, 0.01))
                }) {
                    Image(systemName: "plus")
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .clipShape(Circle())
                }
                .padding(.trailing)
                
                
            }
            
            
            
            
            
            
            
            
            
        }
       
    }
}


//
//
//struct ContentViewMap: View {
//    @State private var centerCoordinate = CLLocationCoordinate2D()
//    @State private var region2 = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.0205, longitude: 6.7335), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
//
//
//    @State private var mapView: MKMapView?
//
//
//
//
//    var body: some View {
////        Map(coordinateRegion: $region2,interactionModes: .all, showsUserLocation: true)
////            .onAppear {
////                            // Set up the map view
////                            mapView = nil
////                        }
////            .onDisappear {
////                            // Clean up the map view
////                            mapView = nil
////                        }
////            .gesture(
////                        TapGesture(count: 1)
////                            .onEnded { gesture in
////
////                                print("-----------------------------------------")
////                                print("-----------------------------------------")
////                                print("-----------gesture")
////                                print(gesture)
////
////
////                                let gestureString = String(describing: gesture)
////                                            print("Gesture: \(gestureString)")
////                                print("-----------------------------------------")
////
////
////
////                                let touchLocation = gesture.location(ofTouch: 0, in: nil)
////                                let coordinate = region2.convert(touchLocation, toCoordinateFrom: nil)
////                                print("Tapped at location: \(coordinate)")
////
////
////
////
////                            }
////                    )
//
//        Map(mapRect: <#Binding<MKMapRect>#>)
//                    .gesture(
//                        TapGesture(count: 1)
//                            .onEnded { gesture in
//                                let location = gesture.location
//
//                                let location = gesture.location(in: nil)
//                                let coordinate = self.region.convert(location, toCoordinateFrom: nil)
//                                print("Tapped at location: \(coordinate.latitude), \(coordinate.longitude)")
//                            }
//                    )
//    }
//}




struct ContentView3: View {
    
    @Environment(\.presentationMode) var presentationMode

    
    
    @State private var coordinate = CLLocationCoordinate2D()
    @State private var region3 = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.0205, longitude: 6.7335), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    
    private var coordinateRegion: Binding<MKCoordinateRegion> {
        Binding(
            get: {
                MKCoordinateRegion(
                    center: coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                )
            },
            set: {
                coordinate = $0.center
            }
        )
    }
    
    
    var body: some View {
        Map(coordinateRegion: $region3, interactionModes: .all, showsUserLocation: true)
            .onTapGesture { coordinate in

                print("-----------------------------------------")
                                                print("-----------------------------------------")
                                                print("-----------coordinate")
                print(coordinate)
                let latitude = Double(coordinate.x)/7.6856
                let longitude = Double(coordinate.y)/34.60
                print("Latitude: \(latitude), Longitude: \(longitude)")

                
                SingletonClass.shared.longitude = longitude
                SingletonClass.shared.latitude = latitude
                SingletonClass.shared.isSayeKamelLocation = true
                
                self.presentationMode.wrappedValue.dismiss()



                //addLocation(long: longitude, lati: latitude)



//                print("Latitude: \(coordinate.latitude), Longitude: \(coordinate.longitude)")
            }
        
        
        VStack {
            Button(action: {
                region3.span = MKCoordinateSpan(latitudeDelta: min(region3.span.latitudeDelta * 2, 180), longitudeDelta: min(region3.span.longitudeDelta * 2, 180))
            }) {
                Image(systemName: "minus")
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .clipShape(Circle())
            }
            .padding(.trailing)
            
            Button(action: {
                region3.span = MKCoordinateSpan(latitudeDelta: max(region3.span.latitudeDelta / 2, 0.01), longitudeDelta: max(region3.span.longitudeDelta / 2, 0.01))
            }) {
                Image(systemName: "plus")
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .clipShape(Circle())
            }
            .padding(.trailing)
            
            
        }
           
    }
    
    
    
    func addLocation(long : Double , lati : Double){
        
        let url = "http://localhost:3007/user/saveMap"
        
        let parameters: [String: Any] = [
                "name": "NameEvent",
                "nameImage": "sfax",
                "latitude": lati,
                "longitude" : long,
                "description":"DescriptionEvent",
                "price" :111111
            ]
        
        
        AF.request(
            url,
            method: .post,
            parameters: parameters)
            .responseJSON { response in
                switch response.result {
                case .success(let value):



                    let jsonRes = JSON(value)

                    print("--------------------------*********************")
                    print(jsonRes)

                    print("--------------------------*********************")

                    if(jsonRes["succes"] == "true"){

//                        let alertController = UIAlertController(title: "Error", message: "Please fill in all the fields", preferredStyle: .alert)
//                        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//                        alertController.addAction(okAction)
//                        self.present(alertController, animated: true, completion: nil)
                        SingletonClass.shared.isSayeKamelLocation = true
                    }












                case .failure(let error):
                    print("*error---------------------------------------------------")
                }
            }

        
        
    }
    
    
}




















//
//
//
//
//struct MapViewFinal: UIViewRepresentable {
//    class Coordinator: NSObject, MKMapViewDelegate {
//        var mapView: MapViewFinal
//
//        init(_ mapView: MapViewFinal) {
//            self.mapView = mapView
//        }
//
//        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
//            mapView.showsUserLocation = true
//        }
//
//        @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
//            let location = gestureRecognizer.location(in: mapView)
//            let coordinate = mapView.mapView.convert(location, toCoordinateFrom: mapView.mapView)
//            print("Tap location: \(coordinate.latitude), \(coordinate.longitude)")
//        }
//    }
//
//    @Binding var centerCoordinate: CLLocationCoordinate2D
//    @Binding var annotations: [MKPointAnnotation]
//    let locationManager = CLLocationManager()
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    func makeUIView(context: Context) -> MKMapView {
//        let mapView = MKMapView()
//        mapView.delegate = context.coordinator
//        mapView.showsUserLocation = true
//        let tapGestureRecognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(_:)))
//        mapView.addGestureRecognizer(tapGestureRecognizer)
//        return mapView
//    }
//
//    func updateUIView(_ uiView: MKMapView, context: Context) {
//        locationManager.requestWhenInUseAuthorization()
//        uiView.setRegion(MKCoordinateRegion(center: centerCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)), animated: true)
//        uiView.addAnnotations(annotations)
//    }
//}




//
//
//
//
//struct MapView123: UIViewRepresentable {
//    @Binding var region: MKCoordinateRegion
//
//    func makeUIView(context: Context) -> MKMapView {
//        let mapView = MKMapView()
//        mapView.delegate = context.coordinator
//        return mapView
//    }
//
//    func updateUIView(_ mapView: MKMapView, context: Context) {
//        mapView.region = region
//    }
//
//    func makeCoordinator() -> MapViewCoordinator {
//        MapViewCoordinator(self)
//    }
//}
//
//class MapViewCoordinator: NSObject, MKMapViewDelegate {
//    var mapView: MapView123
//
//    init(_ mapView: MapView) {
//        self.mapView = mapView
//    }
//
//    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
//        mapView.region = self.mapView.region
//    }
//}










struct MapForEvent_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
