//
//  ResortListView.swift
//  Project_19
//
//  Created by Hasan Abuzayed on 1/28/22.
//

import SwiftUI

struct ResortListView: View {
    let resorts: [Resort]
    
    var body: some View {
        List(resorts) { resort in
            NavigationLink {
                ResortView(resort: resort)
            } label: {
                ResortItemView(resort: resort)
            }
        }
    }
}

struct ResortListView_Previews: PreviewProvider {
    static var previews: some View {
        ResortListView(resorts: Resort.allResorts)
    }
}
