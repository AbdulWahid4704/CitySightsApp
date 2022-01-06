//
//  LaunchView.swift
//  CitySightsApp
//
//  Created by Rusaab Abdul Wahid on 05/01/2022.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
            .environmentObject(ContentModel())
    }
}
