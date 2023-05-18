//
//  MapViewForItemEventMain.swift
//  MiniProject
//
//  Created by Mac Mini 11 on 18/5/2023.
//


import SwiftUI
import MapKit
import CoreLocation


struct MapViewForItemEventMain: View {
    
    
    
    
    
    
    
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.0205, longitude: 6.7335), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    @State private var userTrackingMode: MKUserTrackingMode = .follow
    
    @State private var selectedAnnotation: City?
    
    let annotations2 = [
        City(name: SingletonClass.shared.NameToEventItem,
             coordinate: CLLocationCoordinate2D(latitude: Double(SingletonClass.shared.LatiToEventItem)!, longitude: Double(SingletonClass.shared.LongToEventItem)!),
                          description:SingletonClass.shared.descriptionToEventItem,
             price: SingletonClass.shared.priceToEventItem,
                          date: Date(),
                          image: UIImage(named: "bizerte")),
        
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
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .sheet(item: $selectedAnnotation) { city in
                DetailsEvents(city: city)            }
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

struct MapViewForItemEventMain_Previews: PreviewProvider {
    static var previews: some View {
        MapViewForItemEventMain()
    }
}
