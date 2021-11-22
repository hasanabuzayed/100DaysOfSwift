//
//  LogView.swift
//  Challenge_04
//
//  Created by Hasan Abuzayed on 11/16/21.
//

import SwiftUI

struct LogView: View {
    let log: Log

    var body: some View {
        Text(log.date.formatted(date: .omitted, time: .standard))
            .font(.body)
            .foregroundColor(.green)
            .padding(6)
    }
}


struct LogView_Provider: PreviewProvider {
    static var previews: some View {
        LogView(log: .init(date: .now))
    }
}
