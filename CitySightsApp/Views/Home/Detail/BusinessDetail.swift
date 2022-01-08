//
//  BusinessDetail.swift
//  CitySightsApp
//
//  Created by Rusaab Abdul Wahid on 07/01/2022.
//

import SwiftUI

struct BusinessDetail: View {
    
    var business: Business
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            VStack(spacing: 0) {
                
                GeometryReader { geo in
                    
                    Image(uiImage: UIImage(data: business.imageData ?? Data()) ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                    
                }
                .ignoresSafeArea()
                
                // Open/ closed bar
                ZStack(alignment: .leading) {
                    
                    Rectangle()
                        .frame(height: 36)
                        .foregroundColor(business.isClosed! ? .gray : .blue)
                    
                    Text(business.isClosed! ? "Closed": "Open")
                        .foregroundColor(.white)
                        .bold()
                        .padding(.leading)
                    
                }
                
            }
            
            Group {
                
                // Name
                Text(business.name ?? "")
                    .font(.largeTitle)
                    .padding()
                // Address
                if business.location?.displayAddress != nil {
                    ForEach(business.location!.displayAddress!, id: \.self) { address in
                        
                        Text(address).padding(.horizontal)
                        
                    }
                    
                }
                
                // Rating
                Image("regular_\(business.rating ?? 0.0)")
                    .padding()
                
                Divider()
                
                // Phone number
                HStack {
                    
                    Text("Phone: ")
                        .bold()
                    
                    Text(business.displayPhone ?? "")
                    
                    Spacer()
                    
                    Link("Call", destination: URL(string: ("tel:\(business.phone ?? "")"))!)
                    
                }
                .padding()
                
                Divider()
                
                // Reviews
                HStack {
                    
                    Text("Reviews: ")
                        .bold()
                    
                    Text(String(business.reviewCount ?? 0))
                    
                    Spacer()
                    
                    Link("Read", destination: URL(string: ("\(business.url ?? "")"))!)
                    
                }
                .padding()
                
                Divider()
                
                //Website
                HStack {
                    
                    Text("Website: ")
                        .bold()
                    
                    Text(business.url ?? "")
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Link("Visit", destination: URL(string: ("\(business.url ?? "")"))!)
                    
                }
                .padding()
                
                Divider()
                
            }
            
            // Get derictions button
            Button {
                
            } label: {
                
                ZStack {
                    
                    Rectangle()
                        .frame(height: 50)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    
                    Text("Get Directions")
                        .foregroundColor(.white)
                        .bold()
                    
                }
                .padding()
                
            }

            
            
        }
        
    }
}

//struct BusinessDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessDetail()
//    }
//}
