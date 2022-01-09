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
    @State var selectedBusiness: Business?
    
    var body: some View {
        
        // Check if there is data
        if model.restaurants.count != 0 || model.sights.count != 0 {
            
            NavigationView {
                
                // Check if map view or list view
                if !hasSelectedMapView {
                    
                    // Show list
                    VStack{
                        
                        HStack {
                            
                            Image(systemName: "location")
                            Text("San Francisco")
                            Spacer()
                            Button("Switch to Map View") {
                                
                                self.hasSelectedMapView = true
                                
                            }
                            
                        }
                        
                        Divider()
                        
                        BusinessList()
                        
                    }.padding([.horizontal, .top])
                        .navigationBarHidden(true)
                    
                }
                else {
                    
                    // Show map
                    BusinessMap(selectedBusiness: $selectedBusiness)
                        .ignoresSafeArea()
                        .sheet(item: $selectedBusiness) { business in
                            
                            // Create a detail view with the selected business
                            BusinessDetail(business: business)
                            
                        }
                }
                
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
