//
//  BusinessRow.swift
//  CitySightsApp
//
//  Created by Rusaab Abdul Wahid on 07/01/2022.
//

import SwiftUI

struct BusinessRow: View {
    
    @ObservedObject var business: Business
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                // Image
                Image(uiImage: UIImage(data: business.imageData ?? Data()) ?? UIImage())
                    .resizable()
                    .frame(width: 58,height: 58)
                    .cornerRadius(5)
                    .scaledToFit()
                
                
                // The name and distance
                VStack(alignment: .leading) {
                 
                    Text(business.name ?? "")
                        .bold()
                        .multilineTextAlignment(.leading)
                        
                    Text(String(format: "%.1f km away", (business.distance ?? 0) / 1000  ))
                        .font(.caption)
                    
                }
                
                Spacer()
                
                // The star and reviews
                VStack(alignment: .leading) {
                    
                    Image("regular_\(business.rating ?? 0)")
                    Text (String(business.reviewCount ?? 0) + " Reviews")
                        .font(.caption)
                    
                }
                
            }
            
            Divider()
            
        }
    
    }
}

//struct BusinessRow_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessRow()
//    }
//}
