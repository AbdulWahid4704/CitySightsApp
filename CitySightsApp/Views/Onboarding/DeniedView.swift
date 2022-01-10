//
//  DeniedView.swift
//  CitySightsApp
//
//  Created by Rusaab Abdul Wahid on 10/01/2022.
//

import SwiftUI

struct DeniedView: View {
    
    let backgroundColor = Color(red: 34/255, green: 141/255, blue: 138/255)
    
    var body: some View {
    
        VStack {
            
            Spacer()
            
            Text("Whoops!")
                .bold()
                .font(.title)
                .multilineTextAlignment(.center)
            Text("We need to access your settings to provide you with the best sights. You can change your mind anytime in settings")
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Button {
                
                // Check if there is a settings url
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    
                    // Check if the url can be opened
                    if UIApplication.shared.canOpenURL(url) {
                        
                        // Open the url
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        
                    }
                    
                }
                
            } label: {
                
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    Text("Go To Settings")
                        .bold()
                        .foregroundColor(backgroundColor)
                    
                }
               
            }
            .padding(25)
            
            
            Spacer()
            
        }
        .foregroundColor(.white)
        .background(backgroundColor)
        .ignoresSafeArea(.all, edges: .all)
    
    }
}

struct DeniedView_Previews: PreviewProvider {
    static var previews: some View {
        DeniedView()
    }
}
