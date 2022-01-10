//
//  ProspectsView.swift
//  Project_16
//
//  Created by Hasan Abuzayed on 1/9/22.
//

import SwiftUI
import CodeScanner

struct ProspectsView: View {
    @EnvironmentObject var prospects: Prospects
    @State private var isShowingScanner = false
    @State private var sort: SortType = .name

    let filter: FilterType
    
    var body: some View {
        NavigationView {
            List {
                ForEach(prospects.people(filteredBy: filter, sortedBy: sort)) { prospect in
                    VStack(alignment: .leading) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(prospect.name)
                                    .font(.headline)
                                Text(prospect.emailAddress)
                                    .foregroundColor(.secondary)
                            }
                            if filter == .none && prospect.isContacted {
                                Spacer()
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.green)
                            }
                        }
                    }
                    .swipeActions {
                        if prospect.isContacted {
                            Button {
                                prospects.toggle(prospect: prospect)
                            } label: {
                                Label("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark")
                            }
                            .tint(.blue)
                        } else {
                            Button {
                                prospects.toggle(prospect: prospect)
                            } label: {
                                Label("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark")
                            }
                            .tint(.green)
                            
                            Button {
                                prospects.addNotification(for: prospect)
                            } label: {
                                Label("Remind Me", systemImage: "bell")
                            }
                            .tint(.orange)
                        }
                    }
                }
            }
            .navigationTitle(title)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        isShowingScanner = true
                    } label: {
                        Label("Scan", systemImage: "qrcode.viewfinder")
                    }
                    
                    Menu {
                        Text("Sort by:")
                        
                        Button("Name") {
                            sort = .name
                        }
                        
                        Button("Most Recent") {
                            sort = .mostRecent
                        }
                    } label: {
                        Label("Sort", systemImage: "list.bullet")
                    }
                }
            }
            .sheet(isPresented: $isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], simulatedData: "\(name())\npaul@hackingwithswift.com", completion: handleScan)
            }
        }
    }
    
    private var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    
    private func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            
            let person = Prospect()
            person.name = details[0]
            person.emailAddress = details[1]
            
            prospects.add(person)
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
    
    private func name() -> String {
        [
            "Eden Paul",
            "Edith Valdez",
            "Beulah Garner",
            "Debbie Mac",
            "Merlin Searle",
            "Sami Heath",
            "Jedd O'Sullivan",
            "Manha Southern",
            "Noa Dennis",
            "Zacharia Mcgrath"
        ].randomElement()!
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
            .environmentObject(Prospects())
    }
}
