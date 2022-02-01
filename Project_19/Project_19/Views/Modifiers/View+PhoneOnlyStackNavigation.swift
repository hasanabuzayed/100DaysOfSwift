//
//  View+PhoneOnlyStackNavigation.swift
//  Project_19
//
//  Created by Hasan Abuzayed on 1/28/22.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}
