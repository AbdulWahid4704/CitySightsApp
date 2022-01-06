//
//  BusinessListView.swift
//  CitySightsApp
//
//  Created by Rusaab Abdul Wahid on 06/01/2022.
//

import SwiftUI

struct BusinessList: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView {
            LazyVStack(alignment: .leading,pinnedViews: [.sectionHeaders]) {
                
                // Restaurant section
                BusinessSection(title: "Restuarants", businesses: model.restaurants)
                
                // Sights Section
                BusinessSection(title: "Sights", businesses: model.sights)
                
                }
            }
            
        }
    }


//struct BusinessListView_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessListView()
//    }
//}
