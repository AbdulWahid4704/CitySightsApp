//
//  YelpLogo.swift
//  CitySightsApp
//
//  Created by Rusaab Abdul Wahid on 10/01/2022.
//

import SwiftUI

struct YelpLogo: View {
    
    let link: String
    
    var body: some View {

        Link(destination: URL(string: link)!) {
            
            Image("yelp")
                .resizable()
                .scaledToFit()
                .frame(height: 36)
            
        }

    }
}

struct YelpLogo_Previews: PreviewProvider {
    static var previews: some View {
        YelpLogo(link: "https://www.yelp.com")
    }
}
