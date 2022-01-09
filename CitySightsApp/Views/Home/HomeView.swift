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
                    
                    ZStack(alignment: .top) {
                        
                        // Show map
                        BusinessMap(selectedBusiness: $selectedBusiness)
                            .ignoresSafeArea()
                            .sheet(item: $selectedBusiness) { business in
                                
                                // Create a detail view with the selected business
                                BusinessDetail(business: business)
                                
                            }
                        
                        // Rectangle overlay
                        ZStack {
                            
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .shadow(radius: 5)
                                .frame(height: 48)
                            
                            HStack {
                                
                                Image(systemName: "location")
                                Text("San Francisco")
                                Spacer()
                                Button("Switch to List View") {
                                    
                                    self.hasSelectedMapView = false
                                    
                                }
                                
                            }
                            .padding()
                            
                        }
                        .padding()
                    }
                    .navigationBarHidden(true)
                    
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
