//
//  Chapter16View.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 08/04/23.
//

import SwiftUI

struct Chapter16View: View {
    @ObservedObject var viewModel = RestaurantViewModel()
    @State private var selectedOne: Restaurant?

    var body: some View {

        // CONTEXT MENU, SWIPTE TO DELETE, ACTION SHEET

        // Note: .onDelete modifier can't be applied to List or inside View directly.
        // Instead we have to use the ForEach loop 👈
        List {
            ForEach(viewModel.restaurants) { restaurant in
                BasicImageRow(restaurant: restaurant)
                    .contextMenu { // Showing popup menu with content 👈
                        Button {
                            self.viewModel.delete(restaurant)
                        } label: {
                            HStack {
                                Text("Delete")
                                Image(systemName: "trash")
                            }
                        }
                        Button {
                            self.viewModel.setFavorite(restaurant)
                        } label: {
                            HStack {
                                Text("Favorite")
                                Image(systemName: "star.fill")
                            }
                        }
                    }
                    .onTapGesture {
                        viewModel.showActionSheet = true
                        selectedOne = restaurant
                    }
                    .confirmationDialog( // New API to show the ActionSheet 👈
                        "",
                        isPresented: $viewModel.showActionSheet,
                        presenting: selectedOne // Object used to modify inside the actions 👈
                    ) { kitchen in
                        Button(role: .destructive) {
                            self.viewModel.delete(kitchen)
                        } label: {
                            Text("Delete")
                        }
                        Button("Mark as favorite") {
                            self.viewModel.setFavorite(kitchen)
                        }
                    } message: { kitchen in
                        Text("What do you want to do with \(kitchen.name)?")
                    }
            }
            .onDelete { indexSet in
                self.viewModel.remove(at: indexSet)
            }
        }
        .listStyle(.plain)
        .listRowSeparator(.hidden)
    }
}

struct Chapter16View_Previews: PreviewProvider {
    static var previews: some View {
        Chapter16View()
    }
}
