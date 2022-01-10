//
//  BusinessSectionView.swift
//  CitySightsApp
//
//  Created by Rusaab Abdul Wahid on 06/01/2022.
//

import SwiftUI

struct BusinessSectionHeader: View {
    
    var title: String
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
                .frame(height: 45)
            
            Text(title)
                .font(.headline)
            
        }
    }
}

//struct BusinessSectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessSectionView()
//    }
//}
