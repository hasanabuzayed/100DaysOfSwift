//
//  ViewModel.swift
//  Project_14
//
//  Created by Hasan Abuzayed on 12/13/21.
//

import Foundation
import LocalAuthentication
import MapKit

@MainActor class ViewModel: ObservableObject {
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0),
                                                  span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    @Published private(set) var locations: [Location]
    @Published var selectedPlace: Location?
    @Published var isUnlocked: Bool = false
    @Published var authError: AuthenticationError? = nil

    private let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlaces")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            locations = try JSONDecoder().decode([Location].self, from: data)
        } catch {
            locations = []
        }
    }
    
    func addLocation() {
        let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
        locations.append(newLocation)
        save()
    }
    
    func update(location: Location) {
        guard let selectedPlace = selectedPlace else { return }
        
        if let index = locations.firstIndex(of: selectedPlace) {
            locations[index] = location
            save()
        }
    }
    
    private func save() {
        do {
            let data = try JSONEncoder().encode(locations)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate yourself to unlock your places."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                Task { @MainActor in
                    if success {
                        self.isUnlocked = true
                    } else {
                        self.authError = .failedToAuth
                    }
                }
            }
        } else {
            self.authError = .notAuthAvailable
        }
    }
}

enum AuthenticationError: Error, Identifiable {
    var id: UUID { UUID() }
    
    case failedToAuth, notAuthAvailable
}
