////
////  MapView.swift
////  MiniProject
////
////  Created by Mac Mini 10 on 1/5/2023.
////
//
//import SwiftUI
//import MapKit
//import CoreLocation
//
//
//
//
//
//struct CityAnnotation: View {
//    let city: City
//    
//    var body: some View {
//        VStack {
//            //Text(city.name)
//                //.foregroundColor(.white)
//                //.padding(6)
//                //.background(Color.blue)
//                //.cornerRadius(10)
//                //.onTapGesture {
//                    //print("Tapped ,,,,,\(city.name)")
//                //}
//            
//            
//            Image(systemName: "mappin.circle.fill")
//                .font(.title)
//                .foregroundColor(.red)
//        }
//    }
//}
//
//
//
//
//struct Location: Identifiable {
//    let id = UUID()
//    let name: String
//    let coordinate: CLLocationCoordinate2D
//    
//}
//
//
//
//
//
//
//
//
//struct CityDetail: View {
//    let city: City
//    
//    var body: some View {
//        Text(city.name)
//    }
//}
//
//
//
//
//
//
//
//
//
//
////------------------------------------------------------------------------------------------
////hedhi bech taamel icon f map
//
//struct City: Identifiable {
//    let id = UUID()
//    let name: String
//    let coordinate: CLLocationCoordinate2D
//    let description: String
//    let price: Int
//    let date: Date
//    let image: UIImage?
//    
//}
//
//
////------------------------------------------------------------------------------------------
//
//
//
//struct MapView: View {
//    //    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
//    
//    
//    
//    
//    
//    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.0205, longitude: 6.7335), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
//    @State private var userTrackingMode: MKUserTrackingMode = .follow
//    
//    @State private var selectedAnnotation: City?
//    
//    @State private var tappedLocation: CLLocationCoordinate2D?
//
//    
//    
//    @State var listCity: [City] = []
//    
//    @StateObject private var viewModel = ModelListUser()
//
//        
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    var body: some View {
//        ZStack(alignment: .topTrailing) {
//            Map(coordinateRegion: $region, annotationItems: viewModel.listMapLocationCity) { city in
//                MapAnnotation(coordinate: city.coordinate) {
//                    CityAnnotation(city: city)
//                        .onTapGesture {
//                            selectedAnnotation = city
//
//                        }
//                }
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            
//            .sheet(item: $selectedAnnotation) { city in
//                DetailsEvents(city: city)
//            }
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationTitle("Map")
//            .navigationBarItems(trailing:
//                Button(action: {
//                    selectedAnnotation = nil
//                }, label: {
//                    Text("Back")
//                })
//                .disabled(selectedAnnotation == nil)
//            )
//           
//            
//            
////
//            
//                        
//            
//            
//            
//            VStack {
//                Button(action: {
//                    region.span = MKCoordinateSpan(latitudeDelta: min(region.span.latitudeDelta * 2, 180), longitudeDelta: min(region.span.longitudeDelta * 2, 180))
//                }) {
//                    Image(systemName: "minus")
//                        .padding()
//                        .background(Color.white.opacity(0.8))
//                        .clipShape(Circle())
//                }
//                .padding(.trailing)
//                
//                Button(action: {
//                    region.span = MKCoordinateSpan(latitudeDelta: max(region.span.latitudeDelta / 2, 0.01), longitudeDelta: max(region.span.longitudeDelta / 2, 0.01))
//                }) {
//                    Image(systemName: "plus")
//                        .padding()
//                        .background(Color.white.opacity(0.8))
//                        .clipShape(Circle())
//                }
//                .padding(.trailing)
//                
//                
//            }
//        }
//        .onAppear{
//            
//            viewModel.fetshDataLocation()
//        }
//
//    }
//    
//}
//
//
//
//
//
//struct MapViewEent: View {
//    //    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
//    
//    
//    
//    
//    
//    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.0205, longitude: 6.7335), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
//    @State private var userTrackingMode: MKUserTrackingMode = .follow
//    
//    @State private var selectedAnnotation: City?
//    
//    let annotations2 = [
//        City(name: "London",
//                          coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
//                          description: "A vibrant and diverse city known for its history, culture, and entertainment.",
//                          price: 123,
//                          date: Date(),
//                          image: UIImage(named: "london.jpg")),
//        
//    ]
//    
//    
//    
//    var body: some View {
//        ZStack(alignment: .topTrailing) {
//            Map(coordinateRegion: $region, annotationItems: annotations2) { city in
//                MapAnnotation(coordinate: city.coordinate) {
//                    CityAnnotation(city: city)
//                        .onTapGesture {
//                            selectedAnnotation = city
//
//                        }
//                }
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .sheet(item: $selectedAnnotation) { city in
//                CityDetail(city: city)
//            }
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationTitle("Map")
//            .navigationBarItems(trailing:
//                Button(action: {
//                    selectedAnnotation = nil
//                }, label: {
//                    Text("Back")
//                })
//                .disabled(selectedAnnotation == nil)
//            )
//
////
//            
//                        
//            
//            
//            
//            VStack {
//                Button(action: {
//                    region.span = MKCoordinateSpan(latitudeDelta: min(region.span.latitudeDelta * 2, 180), longitudeDelta: min(region.span.longitudeDelta * 2, 180))
//                }) {
//                    Image(systemName: "minus")
//                        .padding()
//                        .background(Color.white.opacity(0.8))
//                        .clipShape(Circle())
//                }
//                .padding(.trailing)
//                
//                Button(action: {
//                    region.span = MKCoordinateSpan(latitudeDelta: max(region.span.latitudeDelta / 2, 0.01), longitudeDelta: max(region.span.longitudeDelta / 2, 0.01))
//                }) {
//                    Image(systemName: "plus")
//                        .padding()
//                        .background(Color.white.opacity(0.8))
//                        .clipShape(Circle())
//                }
//                .padding(.trailing)
//                
//                
//            }
//        }
//    }
//    
//}
//
//
//
//
//
//
//
//
//
//
//
//
//struct MapView2: UIViewRepresentable {
//    @Binding var region: MKCoordinateRegion
//    @Binding var userTrackingMode: MKUserTrackingMode
//
//    private let locationManager = CLLocationManager()
//
//    func makeUIView(context: Context) -> MKMapView {
//        let mapView = MKMapView()
//        mapView.delegate = context.coordinator
//        mapView.showsUserLocation = true
//        return mapView
//    }
//
//    func updateUIView(_ view: MKMapView, context: Context) {
//        view.setRegion(region, animated: true)
//        view.userTrackingMode = userTrackingMode
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    class Coordinator: NSObject, MKMapViewDelegate {
//        var parent: MapView2
//
//        init(_ parent: MapView2) {
//            self.parent = parent
//        }
//
//        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
//            parent.region = MKCoordinateRegion(center: userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//        }
//    }
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
//
//
//
//
//extension CLLocationCoordinate2D: Identifiable {
//    public var id: String {
//        "\(latitude)-\(longitude)"
//    }
//}
