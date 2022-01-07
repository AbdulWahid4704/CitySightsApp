//
//  HomeView.swift
//  CitySightsApp
//
//  Created by Rusaab Abdul Wahid on 06/01/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var hasSelectedMapView = false
    
    var body: some View {
        
        // Check if there is data
        if model.restaurants.count != 0 || model.sights.count != 0 {
            
            // Check if map view or list view
            if !hasSelectedMapView {
                
                // Show list
                VStack{
                    
                    HStack {
                        
                        Image(systemName: "location")
                        Text("San Francisco")
                        Spacer()
                        Text("Switch to map view")
                        
                    }
                    
                    Divider()
                    
                    BusinessList()
                    
                }.padding([.horizontal, .top])
                
            }
            else {
                
                // Show map
            }
            
        }
        else {
            ProgressView()
        }
        
        
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//            .environmentObject()
//    }
//}
