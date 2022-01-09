//
//  File.swift
//  CitySightsApp
//
//  Created by Rusaab Abdul Wahid on 09/01/2022.
//

import SwiftUI
import MapKit

struct DirectionsMap: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    var business: Business
    
    var start: CLLocationCoordinate2D {
        
        model.locationManager.location?.coordinate ?? CLLocationCoordinate2D()
        
    }
    
    var end: CLLocationCoordinate2D {
        
        if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude {
            
            return CLLocationCoordinate2D(latitude: lat, longitude: long)
            
        } else {
            
            return CLLocationCoordinate2D()
            
        }
        
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        // Make the map
        let map = MKMapView()
        map.delegate = context.coordinator
        map.showsUserLocation = true
        map.userTrackingMode = .followWithHeading
        
        // Make requests
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: start))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: end))
        
        // Make directions
        let directions = MKDirections(request: request)
        
        // Calculate route
        directions.calculate { response, error in
            
            if error == nil && response != nil {
                
                for route in response!.routes {
                    
                    map.addOverlay(route.polyline)
                    
                    map.setVisibleMapRect(route.polyline.boundingMapRect,edgePadding: UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100), animated: true)
                        
                }
                
            }
            
        }
        
        // Creat annotation for end point
        let a = MKPointAnnotation()
        a.coordinate = end
        a.title = business.name ?? ""
        map.addAnnotation(a)
        
        return map
        
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: Coordinator) {
        
        uiView.removeAnnotations(uiView.annotations)
        uiView.removeOverlays(uiView.overlays)
        
    }
    
    // MARK: - Coordinator
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            
            let renderer = MKPolylineRenderer(overlay: overlay as! MKPolyline)
            renderer.strokeColor = .blue
            renderer.lineWidth = 5
            
            return renderer
        }
        
    }
    
}
