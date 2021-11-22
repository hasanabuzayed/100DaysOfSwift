//
//  AddActivityView.swift
//  Challenge_04
//
//  Created by Hasan Abuzayed on 11/17/21.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var activities: Activities
    
    @State private var addActivity = ActivityCRUDViewModel()
    
    var body: some View {
        VStack(spacing: .zero) {
            Form {
                Section {
                    TextField("Title", text: $addActivity.title)
                    VStack(alignment: .leading) {
                        Text("Description")
                            .font(.caption)
                        TextEditor(text: $addActivity.description)
                            .frame(height: 100)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                    }
                }
                Section {
                    Picker("Type", selection: $addActivity.type) {
                        ForEach(ActivityType.allCases, id: \.self) { type in
                            Text(type.rawValue.uppercased())
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Activity Type")
                }
            }
            
            Button("Add") {
                activities.addActivity(addActivity.build())
                dismiss()
            }
            .padding()
            .font(.title2)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(.green)
        }
        .navigationTitle("Add Activity")
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(activities: Activities())
    }
}
