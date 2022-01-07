//
//  Business.swift
//  CitySightsApp
//
//  Created by Rusaab Abdul Wahid on 06/01/2022.
//

import Foundation
import SwiftUI

class Business: Decodable, Identifiable, ObservableObject {
    
    @Published var imageData: Data?
    
    var id: String?
    
    var alias: String?
    var name: String?
    var imageUrl: String?
    var isClosed: Bool?
    var url: String?
    var reviewCount: Int?
    var categories: [Category]?
    var rating: Double?
    var coordinates: Coordinate?
    var transactions: [String]?
    var price: String?
    var location: Location?
    var phone: String?
    var displayPhone: String?
    var distance: Double?
    
    // Coding keys
    enum CodingKeys: String, CodingKey {
        
        case imageUrl = "image_url"
        case displayPhone = "display_phone"
        case isClosed = "is_closed"
        case reviewCount = "review_count"

        case id
        case alias
        case name
        case url
        case categories
        case rating
        case coordinates
        case transactions
        case price
        case location
        case phone
        case distance
        
    }
    
    // Method to get image data
    func getImageData() {
        
        // Check imageurl for nil
        guard let imageUrl = imageUrl else {
            return
        }

        // Download the data
        if let url = URL(string: imageUrl) {
            
            let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let data = data {
                    
                    DispatchQueue.main.async {
                        self.imageData = data
                    }
                
                }
                
            }
            
            dataTask.resume()
            
        }
        
    }
    
}

struct Location: Decodable {
    
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var zipCode: String?
    var country: String?
    var state: String?
    var displayAddress: [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case zipCode = "zip_code"
        case displayAddress = "display_address"
        
        case address1
        case address2
        case address3
        case city
        case country
        case state
        
            
    }
    
}

struct Category: Decodable {
    
    var alias: String
    var title: String
    
}

struct Coordinate: Decodable {
    
    var latitude: Double?
    var longitude: Double?
    
}
