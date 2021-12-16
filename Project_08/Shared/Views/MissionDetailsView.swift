//
//  MissionDetailsView.swift
//  Project_08
//
//  Created by Hasan Abuzayed on 11/10/21.
//

import SwiftUI

struct MissionDetailsView: View {
    let viewModel: MissionDetailsViewModel
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image(viewModel.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.6)
                        .padding(.top)
                        .accessibilityLabel(Text("Mission Logo"))

                    Text(viewModel.formattedLaunchDate)
                        .accessibilityLabel("Launch Date")
                        .accessibilityValue(Text(viewModel.mission.formattedLaunchDate))
                    
                    VStack(alignment: .leading) {
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(viewModel.mission.description)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                    }
                    .padding(.horizontal)
                    
                    CrewMembersView {
                        ForEach(viewModel.crewMembers, id: \.role) { member in
                            NavigationLink {
                                CrewMemberDetailsView(crewMember: member)
                            } label: {
                                CrewMemberView(crewMember: member)
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(viewModel.mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct MissionDetailsView_Previews: PreviewProvider {
    static let viewModel = MissionsViewModel()

    static var previews: some View {
        MissionDetailsView(viewModel: viewModel.missions[1])
            .preferredColorScheme(.dark)
    }
}
