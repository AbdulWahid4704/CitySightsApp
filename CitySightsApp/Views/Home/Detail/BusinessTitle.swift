//
//  BusinessTitle.swift
//  CitySightsApp
//
//  Created by Rusaab Abdul Wahid on 09/01/2022.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            
            // Name
            Text(business.name ?? "")
                .font(.largeTitle)
                
            // Address
            if business.location?.displayAddress != nil {
                ForEach(business.location!.displayAddress!, id: \.self) { address in
                    
                    Text(address)
                    
                }
                
            }
            
            // Rating
            Image("regular_\(business.rating ?? 0.0)")
                
            
        }
        
    }
}

