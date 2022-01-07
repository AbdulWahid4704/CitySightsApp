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
    
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    
    @Published var restaurants = [Business]()
    @Published var sights = [Business]()
    
    override init () {
        super.init()
        
        // Set the delegate to the content model
        locationManager.delegate = self
        
        // Request permission
        locationManager.requestWhenInUseAuthorization()
        
        
    }
    
    // MARK: - Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        // update the authorization state property
        authorizationState = locationManager.authorizationStatus
        
        // Check authorization status and start updating
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
            getBusinesses(category: Constants.sightsKey, location: userLocation)
            getBusinesses(category: Constants.restaurantKey, location: userLocation)
        }
        
    }
    
    // MARK: - Yelp Methods
    func getBusinesses(category: String, location: CLLocation) {
        
        // Create the component
        var urlComponent = URLComponents(string: Constants.urlKey)
        
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
            request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                guard let data = data else {
                    return
                }
                
                do {
                    
                    let result = try JSONDecoder().decode(BusinessSearch.self, from: data)
                    
                    // Sort
                    var businesses = result.businesses
                    businesses.sort { b1, b2 in
                        b1.distance ?? 0 < b2.distance ?? 0
                    }
                    
                    // Get image
                    for b in businesses {
                        b.getImageData()
                    }
                    
                    DispatchQueue.main.async {
                        
                        // check and assing to property
                        switch category {
                            
                        case Constants.sightsKey:
                            self.sights = businesses
                        case Constants.restaurantKey:
                            self.restaurants = businesses
                        default:
                            break
                            
                        }
                        
                    }
                    
                }
                catch {
                    print("Couldnt decode")
                    print(error)
                }
                
            }
            
            task.resume()
            
        }
        
        
    }
    
}
