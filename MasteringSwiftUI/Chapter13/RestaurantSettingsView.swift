//
//  SettingsView.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 02/04/23.
//

import SwiftUI

struct RestaurantSettingsView: View {
    @EnvironmentObject var settingStore: SettingsStore
    @State private var selectedOrder = DisplayOrderType.alphabetic
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5
    @Environment(\.presentationMode) var presentMode

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Display Order", selection: $selectedOrder) {
                        ForEach(DisplayOrderType.allCases, id: \.self) { type in
                            Text(type.text)
                        }
                    }
                    .pickerStyle(.menu)
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
                leading: Button(action: {
                    presentMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                        .foregroundColor(.black)
                },
                trailing: Button(action: {
                    settingStore.displayOrder = selectedOrder
                    settingStore.showCheckInOnly = showCheckInOnly
                    settingStore.maxPriceLevel = maxPriceLevel
                    presentMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                        .foregroundColor(.black)
                }
            )
            .onAppear {
                selectedOrder = settingStore.displayOrder
                showCheckInOnly = settingStore.showCheckInOnly
                maxPriceLevel = settingStore.maxPriceLevel
            }
        }
    }
}

struct RestaurantSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantSettingsView()
            .environmentObject(SettingsStore())
    }
}
