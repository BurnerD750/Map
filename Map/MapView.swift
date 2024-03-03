//
//  MapView.swift
//  Map
//
//  Created by Bana on 2024/02/25.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    let searchKey: String
    
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        print(searchKey)
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(
            searchKey,
            completionHandler: {
                (placemarks, error) in
                if let unrapPlacemarks = placemarks,
                   let firstPlacemark = unrapPlacemarks.first,
                   let location = firstPlacemark.location {
                    let targetCoordinate = location.coordinate
                    print(targetCoordinate)
                    
                    let pin = MKPointAnnotation()
                    
                    pin.coordinate = targetCoordinate
                    pin.title = searchKey
                    uiView.addAnnotation(pin)
                    uiView.region = MKCoordinateRegion(
                        center: targetCoordinate,
                        latitudinalMeters: 500.0,
                        longitudinalMeters: 500.0)
                }
            })
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "東京都港区芝公園４丁目２−８")
    }
}
