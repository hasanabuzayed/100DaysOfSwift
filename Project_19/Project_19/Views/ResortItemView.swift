//
//  ResortItemView.swift
//  Project_19
//
//  Created by Hasan Abuzayed on 1/28/22.
//

import SwiftUI

struct ResortItemView: View {
    let resort: Resort
    @EnvironmentObject var favorites: FavoritesViewModel

    var body: some View {
        Group {
            Image(resort.country)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 25)
                .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .stroke(.black, lineWidth: 1)
                )
            
            VStack(alignment: .leading) {
                Text(resort.name)
                    .font(.headline)
                Text("\(resort.runs) runs")
                    .foregroundColor(.secondary)
                
                if favorites.contains(resort) {
                    Spacer()
                    Image(systemName: "heart.fill")
                        .accessibilityLabel("This is a favorite resort")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct ResortItemView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            ResortItemView(resort: .example)
                .environmentObject(FavoritesViewModel())
        }
    }
}
