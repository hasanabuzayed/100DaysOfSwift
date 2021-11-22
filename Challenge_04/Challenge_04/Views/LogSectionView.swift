//
//  LogSectionView.swift
//  Challenge_04
//
//  Created by Hasan Abuzayed on 11/17/21.
//

import SwiftUI

struct LogSectionView: View {
    let viewModel: LogViewModel

    var body: some View {
        Section {
            LogsListView {
                ForEach(viewModel.logs) { log in
                    LogView(log: log)
                }
            }
        } header: {
            Text(viewModel.groupDate.formatted(date: .complete, time: .omitted))
        }
    }
}
