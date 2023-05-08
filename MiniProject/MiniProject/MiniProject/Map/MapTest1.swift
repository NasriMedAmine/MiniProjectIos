//import SwiftUI
//import MapKit
//
//struct MapTest1: UIViewRepresentable {
//    @Binding var coordinate: CLLocationCoordinate2D?
//    
//    func makeUIView(context: Context) -> MKMapView {
//        let mapView = MKMapView()
//        mapView.delegate = context.coordinator
//        let tunisiaLocation = CLLocationCoordinate2D(latitude: 34.0205, longitude: 6.7335)
//        mapView.setRegion(MKCoordinateRegion(center: tunisiaLocation, span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)), animated: true)
//        return mapView
//    }
//    
//    func updateUIView(_ mapView: MKMapView, context: Context) {
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//    
//    class Coordinator: NSObject, MKMapViewDelegate {
//        var parent: MapTest1
//        
//        init(_ parent: MapTest1) {
//            self.parent = parent
//        }
//        
//        func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
//            for view in views {
//                if let gestureRecognizers = view.gestureRecognizers {
//                    for recognizer in gestureRecognizers {
//                        if recognizer is UITapGestureRecognizer {
//                            view.isUserInteractionEnabled = true
//                            view.addGestureRecognizer(recognizer)
//                        }
//                    }
//                }
//            }
//        }
//        
//        @objc func mapViewTapped(_ gestureRecognizer: UITapGestureRecognizer) {
//            if gestureRecognizer.state == .ended {
//                let mapView = gestureRecognizer.view as! MKMapView
//                let tapPoint = gestureRecognizer.location(in: mapView)
//                let coordinate = mapView.convert(tapPoint, toCoordinateFrom: mapView)
//                parent.coordinate = coordinate
//            }
//        }
//    }
//}
//
//struct MapViewTest: View {
//    @State var coordinate: CLLocationCoordinate2D?
//    
//    var body: some View {
//        ZStack(alignment: .top) {
//            MapTest1(coordinate: $coordinate)
//            if let coordinate = coordinate {
//                Text("Lat: \(coordinate.latitude), Lon: \(coordinate.longitude)")
//                    .padding(10)
//                    .background(Color.white)
//                    .cornerRadius(5)
//                    .padding(10)
//            }
//        }
//        .gesture(TapGesture(count: 2).onEnded {
//            print("---------------------------------------------------------------")
//
//            print("Double tap detected!")
//            print("---------------------------------------------------------------")
//            print("---------------------------------------------------------------")
//            print("---------------------------------------------------------------")
//
//            
//        })
//    }
//}
