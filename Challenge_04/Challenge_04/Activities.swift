//
//  Activities.swift
//  Challenge_04
//
//  Created by Hasan Abuzayed on 11/17/21.
//

import Foundation

class Activities: ObservableObject {
    @Published var activities: [Activity] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "Activities"),
           let decodedActivities = try? JSONDecoder().decode([Activity].self, from: data) {
            activities = decodedActivities
        }
    }

    func addActivity(_ activity: Activity) {
        activities.append(activity)
    }

    func removeActivities(at offsets: IndexSet) {
        activities.remove(atOffsets: offsets)
    }
}
