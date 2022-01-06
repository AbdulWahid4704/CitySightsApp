//
//  BusinessSearch.swift
//  CitySightsApp
//
//  Created by Rusaab Abdul Wahid on 06/01/2022.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
    
}

struct Region: Decodable {
    
    var center = Coordinate()
    
}
