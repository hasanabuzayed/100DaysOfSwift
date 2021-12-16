//
//  ContentView.swift
//  Shared
//
//  Created by Hasan Abuzayed on 11/10/21.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = MissionsViewModel()
    
    var body: some View {
        NavigationView {
            container {
                ForEach(viewModel.missions) { mission in
                    NavigationLink {
                        MissionDetailsView(viewModel: mission)
                    } label: {
                        MissionView(viewModel: mission)
                    }
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground )
            .toolbar {
                Button {
                    viewModel.displayMode.toggled()
                } label: {
                    Image(systemName: viewModel.displayMode.image)
                        .foregroundColor(.white)
                        .accessibilityHidden(true)
                }
                .accessibilityValue(Text(viewModel.displayMode.accessibilityLabel))
            }
        }
    }
    
    @ViewBuilder
    private func container<Content: View>(@ViewBuilder content: @escaping () -> Content) -> some View {
        switch viewModel.displayMode {
        case .grid:
            MissionsGridView(content: content)
        case .list:
            MissionsListView(content: content)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
