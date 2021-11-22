//
//  ActivityViewModel.swift
//  Challenge_04
//
//  Created by Hasan Abuzayed on 11/16/21.
//

import SwiftUI

struct ActivityViewModel {
    let logsSections: [LogViewModel]

    var color: Color {
        switch activity.type {
        case .build:
            return .green
        case .quit:
            return .red
        }
    }

    let activity: Activity
    init(activity: Activity) {
        self.activity = activity

        logsSections = activity.logs.sliced(by: [.year, .month, .day], for: \.date).compactMap (LogViewModel.init)
    }
}
