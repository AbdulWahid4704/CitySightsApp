//
//  BusinessSectin.swift
//  CitySightsApp
//
//  Created by Rusaab Abdul Wahid on 06/01/2022.
//

import SwiftUI

struct BusinessSection: View {
    
    var title: String
    var businesses: [Business]
    
    var body: some View {
        
        Section(header: BusinessSectionHeader(title: title)){
        
            ForEach(businesses) { business in
                
                NavigationLink {
                    BusinessDetail(business: business)
                } label: {
                    BusinessRow(business: business)
                }

                
            }
        }.tint(.black)
        
    }
}

//struct BusinessSectin_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessSectin()
//    }
//}
