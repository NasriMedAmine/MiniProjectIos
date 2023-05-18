//
//  MapTest.swift
//  TestSwiftUi2
//
//  Created by Mac Mini 10 on 28/3/2023.
//

import SwiftUI
import MapKit

struct MapTest: View {
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 34,
            longitude: -116
        ),
        
        span: MKCoordinateSpan(
            latitudeDelta: 0.2,
            longitudeDelta: 0.2
        )
        
    )
    
    
    
    
    
    var body: some View {
        Map(coordinateRegion: $region)
            .padding(.all)
    }
}

struct MapTest_Previews: PreviewProvider {
    static var previews: some View {
        MapTest()
    }
}
