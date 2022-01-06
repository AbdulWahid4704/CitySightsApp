//
//  ContentModel.swift
//  CitySightsApp
//
//  Created by Rusaab Abdul Wahid on 06/01/2022.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    
    var locationManager = CLLocationManager()
    
    override init () {
        super.init()
        
        // Set the delegate to the content model
        locationManager.delegate = self
        
        // Request permission
        locationManager.requestWhenInUseAuthorization()
        
        
    }
    
    // MARK: - Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if locationManager.authorizationStatus == .authorizedWhenInUse || locationManager.authorizationStatus == .authorizedAlways {
            
            locationManager.startUpdatingLocation()
            
        } else if locationManager.authorizationStatus == .denied {
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // get the location
        let userLocation = locations.first
        
        //Check if location is there
        if let userLocation = userLocation {
            
            // Stop after getting once
            locationManager.stopUpdatingLocation()
            
            // TODO: if we have the coordinates of the user send to yelp
            // getBusinesses(category: "arts", location: userLocation)
            getBusinesses(category: "restaurants", location: userLocation)
        }
        
    }
    
    // MARK: - Yelp Methods
    func getBusinesses(category: String, location: CLLocation) {
        
        // Create the component
        var urlComponent = URLComponents(string: "https://api.yelp.com/v3/businesses/search")
        
        urlComponent?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: "6")
        ]
        
        // get url
        let url = urlComponent?.url
        
        // Check url
        if let url = url {
            
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.addValue("Bearer X8j5Hs31Aq7wI29vw81YwCJuguJAY8DU8cundNTYyCqrFsicTYwgwUtUehc89kGeL2sphRllhWuwjaevfopdTqik8lO8iuopbmIlpejbaNCbs4VZOYih0DaimbnWYXYx", forHTTPHeaderField: "Authorization")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                if error == nil {
                    print(response)
                }
                
            }
            
            task.resume()
            
        }
        
        
    }
    
}
