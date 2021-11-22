//
//  CrewMembersView.swift
//  Project_08
//
//  Created by Hasan Abuzayed on 11/10/21.
//

import SwiftUI

struct CrewMembersView<Content: View>: View {
    @ViewBuilder
    var content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Crew Members")
                .font(.title.bold())
                .padding(.bottom, 5)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    content()
                }
            }
        }
    }
}

struct CrewMembersView_Previews: PreviewProvider {
    static var previews: some View {
        CrewMembersView {
            Text("Test")
        }
    }
}
