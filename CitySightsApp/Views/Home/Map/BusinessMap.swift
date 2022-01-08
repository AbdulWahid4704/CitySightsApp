//
//  BusinessMap.swift
//  CitySightsApp
//
//  Created by Rusaab Abdul Wahid on 08/01/2022.
//

import Foundation
import SwiftUI
import MapKit

struct BusinessMap: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    
    var locations : [MKPointAnnotation] {
        
        var annotations = [MKPointAnnotation]()
        
        // Loop through the businesses
        for business in model.restaurants + model.sights {
            
            // Check if there is lat and long
            if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude {
                
                // Create an annotation and assign the businesses lat/long
                let a = MKPointAnnotation()
                
                a.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                a.title = business.name ?? ""
                
                annotations.append(a)
            }
            
        }
        
        return annotations
        
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView()
        
        // Show the user
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        
        return mapView
        
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        // Remove the annotations
        uiView.removeAnnotations(uiView.annotations)
        
        // Add the new annotations
        uiView.showAnnotations(self.locations, animated: true)
        
        
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        
        uiView.removeAnnotations(uiView.annotations)
        
    }
    
}
