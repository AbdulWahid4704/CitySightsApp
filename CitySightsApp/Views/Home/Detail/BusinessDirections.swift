//
//  BusinessDirections.swift
//  CitySightsApp
//
//  Created by Rusaab Abdul Wahid on 09/01/2022.
//

import SwiftUI

struct BusinessDirections: View {
    
    var business: Business
    
    var body: some View {
        
        VStack {
            
            HStack {
                BusinessTitle(business: business)
                    
                
                Spacer()
                
                // Check lat, long
                if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude, let urlName = business.name?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                    Link("Open In Maps", destination: URL(string: "http://maps.apple.com/?11=\(lat),\(long)&q=\(urlName)")!)
                    
                }
            }
            .padding()
            
            DirectionsMap(business: business)
                
            
        }.ignoresSafeArea(.all, edges: .bottom)
    }
}

