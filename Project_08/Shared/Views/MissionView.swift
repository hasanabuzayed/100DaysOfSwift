//
//  MissionView.swift
//  Project_08
//
//  Created by Hasan Abuzayed on 11/10/21.
//

import SwiftUI

struct MissionView: View {
    let viewModel: MissionDetailsViewModel

    var body: some View {
        VStack {
            Image(viewModel.mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            
            VStack {
                Text(viewModel.mission.displayName)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(viewModel.mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.lightBackground)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(.lightBackground)
        )
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    static var previews: some View {
        MissionView(viewModel: MissionDetailsViewModel(mission: missions[1], crewMembers: []))
    }
}
