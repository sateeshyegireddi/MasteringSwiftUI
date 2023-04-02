//
//  Chapter12View.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 01/04/23.
//

import SwiftUI

struct Chapter12View: View {
    @State private var showDetailView = false
    @State private var selectedArticle: TechArticle?

    var body: some View {
        
        // PRESENT VIEW IN MODAL FASHION

        // .sheet(isPresented: Binding<Bool>) modifier
        // It accepts a boolean to control the sheet presentation.
        // Note: This view does not show the view in modal view for the first time
        // because `selectedArticle` is nil. Once you select the different article
        // we can see the content in presented view.
        
        // It seems .sheet(isPresented: ) is not suitable for passing the selected data to modal view.
        // It is best suit for showing/controlling the modal view.

        NavigationStack { // NavigationView does not show list in iPad 👈
            List(TechArticle.articles) { article in
                TechArticleRowView(article: article)
                    .onTapGesture {
                        self.showDetailView = true // This controls presentation 👈
                        self.selectedArticle = article
                    }
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
            .sheet(isPresented: $showDetailView) { // This presents the view. 👈
                if let selectedArticle {
                    TechArticleDetailView(article: selectedArticle)
                }
            }
            .navigationTitle("Your Reading")
        }

         
        // .sheet(item: Binding<Object?>) modifier
        // It accepts an object to control the sheet presentation.
        // Whenever the object is set, the sheet gets presented. That's how it works.
        // This does not have the drawback of .sheet(isPresented: )
        /*
        NavigationStack { // NavigationView does not show list in iPad 👈
            List(TechArticle.articles) { article in
                TechArticleRowView(article: article)
                    .onTapGesture {
                        self.selectedArticle = article // Comment this to see the magic! 🙂
                    }
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
            .fullScreenCover(item: $selectedArticle) { article in
                ModalArticleDetailView(article: article)
            }
//            .sheet(item: $selectedArticle) { article in
//                ModalArticleDetailView(article: article)
//            }
            .navigationTitle("Your Reading")
        }
        */
        
        // .fullScreenCover(item: Binding<Object?>) modifier
        // We use this modifier to show the presented view in full screen. 👈
        /*
        NavigationStack {
            List(TechArticle.articles) { article in
                TechArticleRowView(article: article)
                    .onTapGesture {
                        self.selectedArticle = article // Comment this to see the magic! 🙂
                    }
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
            .fullScreenCover(item: $selectedArticle) { article in
                ModalArticleDetailView(article: article)
            }
            .navigationTitle("Your Reading")
        }
        */
    }
}

struct Chapter12View_Previews: PreviewProvider {
    static var previews: some View {
        Chapter12View()
    }
}

struct ModalArticleDetailView: View {
    @Environment(\.presentationMode) var mode
    var article: TechArticle
    @State private var showAlert = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(article.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                Group {
                    Text(article.title)
                        .font(.system(.largeTitle, design: .rounded, weight: .bold))
                        .lineLimit(3)
                    Text("BY " + article.author)
                        .textCase(.uppercase)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 0)
                .padding(.horizontal)

                Text(article.content)
                    .font(.body)
                    .padding()
                    .lineLimit(1000)
                    .multilineTextAlignment(.leading)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(alignment: .topTrailing) {
            Button {
                showAlert = true
            } label: {
                Image(systemName: "chevron.down.circle.fill")
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            .padding(.trailing, 20)
            .padding(.top, 40)
        }
        
        // SHOW ALERTS IN VIEW
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Remainder"),
                message: Text("Are you sure finish reading this article?"),
                primaryButton: .default(Text("Yes")) {
                    mode.wrappedValue.dismiss()
                },
                secondaryButton: .cancel(Text("No"))
            )
        }
    }
}

struct ModalArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ModalArticleDetailView(article: TechArticle.articles[2])
    }
}
