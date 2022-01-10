//
//  LaunchView.swift
//  CitySightsApp
//
//  Created by Rusaab Abdul Wahid on 05/01/2022.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        
        // Check authorization status
        if model.authorizationState == .notDetermined{
            
            // if not determined, Show onboarding
            OnboardingView()
        }
        else if model.authorizationState == .authorizedAlways || model.authorizationState == .authorizedWhenInUse {
            
            // if allowed show home
            HomeView()
        }
        else {
           
            // if denied show denied view
            DeniedView()
            
        }
        
   
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
            .environmentObject(ContentModel())
    }
}
