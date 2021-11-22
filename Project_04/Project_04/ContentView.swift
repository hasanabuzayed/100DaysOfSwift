//
//  ContentView.swift
//  Project_04
//
//  Created by Hasan Abuzayed on 10/27/21.
//

import CoreML
import SwiftUI

struct ContentView: View {
    private static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }

    @State private var wakeUp = Self.defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1

    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false

    var body: some View {
        NavigationView {
            ZStack {
                RadialGradient(colors: [.orange, .white, .black], center: .topLeading, startRadius: 100, endRadius: 300)

                VStack(spacing: .zero) {
                    Form {
                        Section {
                            HStack {
                                Spacer()
                            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: [.hourAndMinute])
                                .labelsHidden()
                            }
                        } header: {
                            Text("When do you want to wake up?")
                                .font(.headline)
                        }

                        Section {
                            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                        } header: {
                            Text("Desired amount of sleep")
                                .font(.headline)
                        }

                        Section {
                            Picker("Number of Cups", selection: $coffeeAmount) {
                                ForEach(1...10, id: \.self) {
                                    Text("\($0) cup\($0 > 1 ? "s" : "")")
                                }
                            }
                        } header: {
                            Label("Daily coffee intake", systemImage: "clock")
                                .labelStyle(.titleOnly)
                                .font(.headline)
//                            Text("Daily coffee intake")
//                                .font(.headline)
                        }
                    }
                    .listRowInsets(.init())
                    .listRowBackground(Color.red)

                    Text("Your ideal bedtime is \(calculateBedTime())")
                        .padding()
                        .foregroundColor(.white)
                }
            }
            .navigationTitle("BetterRest")
        }
    }

    private func calculateBedTime() -> String {
        let config = MLModelConfiguration()
        let model = try? SleepCalculator(configuration: config)

        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60

        let prediction = try? model?.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

        let sleepTime  = wakeUp - (prediction?.actualSleep ?? 0)

        return sleepTime.formatted(date: .omitted, time: .shortened)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
