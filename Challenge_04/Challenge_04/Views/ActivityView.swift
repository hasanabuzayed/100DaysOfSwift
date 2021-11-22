//
//  ActivityView.swift
//  Challenge_04
//
//  Created by Hasan Abuzayed on 11/17/21.
//

import SwiftUI

struct ActivityView: View {
    let viewModel: ActivityViewModel

    var body: some View {
        HStack {
            HStack(spacing: 2) {
                Rectangle()
                    .fill(viewModel.color)
                    .frame(maxHeight: .infinity)
                    .frame(width: 3)
                Rectangle()
                    .fill(viewModel.color)
                    .frame(maxHeight: .infinity)
                    .frame(width: 3)
                Rectangle()
                    .fill(viewModel.color)
                    .frame(maxHeight: .infinity)
                    .frame(width: 3)
            }

            VStack(alignment: .leading) {
                Text(viewModel.activity.title)
                    .font(.headline)
                Text(viewModel.activity.description)
                    .font(.caption)
            }

            Spacer()
        }
    }
}

struct ActivityView_Provider: PreviewProvider {
    static var previews: some View {
        ActivityView(viewModel: .init(activity: Activity(title: "Title", description: "description", type: .quit, tags: [], logs: [])))
    }
}

