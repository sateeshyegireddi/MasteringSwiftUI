//
//  SettingsView.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 02/04/23.
//

import SwiftUI

struct RestaurantSettingsView: View {
    var displayOrders = ["Alphabetical",
                         "Show Favorite First",
                         "Show Check-i n First"]
    @State private var selectedOrder = 0
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Display Order", selection: $selectedOrder) {
                        ForEach(0..<displayOrders.count, id: \.self) {
                            Text(displayOrders[$0])
                        }
                    }
                    .pickerStyle(.navigationLink)
                } header: {
                    Text("Sort Preference")
                        .textCase(.uppercase)
                }
                Section {
                    VStack {
                        Toggle(isOn: $showCheckInOnly) {
                            Text("Show Check-in Only")
                        }
                        Divider()
                        Stepper("Show \(String(repeating: "$", count: maxPriceLevel)) or below", value: $maxPriceLevel, in: 1...5, step: 1)
                    }
                } header: {
                    Text("Filter Preference")
                        .textCase(.uppercase)
                }
            }
            .navigationTitle("Settings")
            .navigationBarItems(
                leading: Button(action: { }) {
                    Text("Cancel")
                        .foregroundColor(.black)
                },
                trailing: Button(action: { }) {
                    Text("Save")
                        .foregroundColor(.black)
                }
            )
        }
    }
}

struct RestaurantSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantSettingsView()
    }
}
