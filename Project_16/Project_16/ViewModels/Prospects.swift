//
//  Prospects.swift
//  Project_16
//
//  Created by Hasan Abuzayed on 1/9/22.
//

import Foundation
import UserNotifications

@MainActor class Prospects: ObservableObject {
    @Published private var people: [Prospect]
    
    private let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedData")
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            people = try JSONDecoder().decode([Prospect].self, from: data)
        } catch {
            people = []
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(prospect: Prospect) {
        objectWillChange.send()
        prospect.updated = .now
        prospect.isContacted.toggle()
        save()
    }
    
    func people(filteredBy filter: FilterType, sortedBy sort: SortType) -> [Prospect] {
        var prospects: [Prospect] = []
        switch filter {
        case .none:
            prospects = people
        case .contacted:
            prospects = people.filter { $0.isContacted }
        case .uncontacted:
            prospects = people.filter { !$0.isContacted }
        }
        
        return prospects.sorted { lhs, rhs in
            switch sort {
            case .name:
                return lhs.name < rhs.name
            case .mostRecent:
                return lhs.updated > rhs.updated
            }
        }
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default
            
            var dateComponents = DateComponents()
            dateComponents.hour = 9
//            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("D'oh")
                    }
                }
            }
        }
    }
    
    private func save() {
        do {
            let data = try JSONEncoder().encode(people)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
}
