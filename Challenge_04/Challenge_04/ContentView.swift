//
//  ContentView.swift
//  Challenge_04
//
//  Created by Hasan Abuzayed on 11/16/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var activities = Activities()

    @State private var addActivity = ActivityCRUDViewModel()
    
    var body: some View {
        NavigationView {
            ActivityListView {
                ForEach(activities.activities) { activity in
                    ActivityView(viewModel: .init(activity: activity))
                }
                .onDelete(perform: activities.removeActivities)
            }.navigationTitle("Habit Tracker")
                .toolbar {
                    NavigationLink {
                        AddActivityView(activities: activities)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
