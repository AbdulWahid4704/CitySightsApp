//
//  OnboardingView.swift
//  CitySightsApp
//
//  Created by Rusaab Abdul Wahid on 09/01/2022.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var selectedTab = 0
    
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    private let green = Color(red: 55/255, green: 197/255, blue: 192/255)
    
    var body: some View {
        
        VStack {
            
            TabView(selection: $selectedTab) {
                
                // First tab
                VStack(spacing: 20) {
                    
                    Image("city2")
                        .resizable()
                        .scaledToFit()
                    Text("Welcome to City Sights!")
                        .bold()
                        .font(.title)
                        .multilineTextAlignment(.center)
                    Text("City sights help you find the best of the city!")
                        .multilineTextAlignment(.center)
                }
                .padding()
                .tag(0)
                .foregroundColor(.white)
                
                // Second tab
                VStack(spacing: 20) {
                    
                    Image("city1")
                        .resizable()
                        .scaledToFit()
                    Text("Ready To Discover Your City?")
                        .bold()
                        .font(.title)
                        .multilineTextAlignment(.center)
                    Text("We'll show you the best restaurans, venues and more based on your location")
                        .multilineTextAlignment(.center)
                }
                .padding()
                .tag(1)
                .foregroundColor(.white)
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            
            Button {
                
                // Check which tab
                if selectedTab == 0 {
                    selectedTab = 1
                }
                else {
                    // request to Geolocate the user
                    model.requestGeolocationPermission()
                    
                }
                
            } label: {
                
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    Text(selectedTab == 0 ? "Next" : "Get My Location")
                        .bold()
                        .foregroundColor(selectedTab == 0 ? .blue : .green)
                    
                }
               
            }
            .padding()
            .padding(.bottom, 30)
            .tint(selectedTab == 0 ? blue : green)
            
            Spacer()
            
        }
        .background(selectedTab == 0 ? blue : green)
        .ignoresSafeArea()
    }
}

