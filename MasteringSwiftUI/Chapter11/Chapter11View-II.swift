//
//  Chapter11View-II.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 01/04/23.
//

import SwiftUI

struct Chapter11View_II: View {

    var body: some View {

        // NAVIGATION WITH DATA
        // We don't have an option to hide or disable the disclosure icon. 👈
        // So, we create ZStack with Content and EmptyView in NavigationLink by keeping opacity as zero. 😎
        NavigationView {
            List(TechArticle.articles) { article in
                let techArticleDetailView = TechArticleDetailView(article: article)
                ZStack {
                    TechArticleRowView(article: article)
                    NavigationLink(destination: techArticleDetailView) {
                        EmptyView() // Magic! 😎
                    }
                    .opacity(0) // Double Magic!! 🤩
                }
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
            .navigationTitle("Your Reading")
        }
    }
}

struct Chapter11View_II_Previews: PreviewProvider {
    static var previews: some View {
        Chapter11View_II()
    }
}

struct TechArticleRowView: View {
    var article: TechArticle

    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Image(article.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            Text(article.title)
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
            HStack {
                ForEach(0..<article.rating, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            Text("BY " + article.author)
                .textCase(.uppercase)
                .foregroundColor(.secondary)
            Text(article.excerpt)
                .foregroundColor(.secondary)
        }
    }
}

struct TechArticleDetailView: View {
    @Environment(\.presentationMode) var mode
    var article: TechArticle

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
        .navigationBarBackButtonHidden()
        // .navigationBarHidden(true) // Don't try this to hide Back button 💡
        .navigationBarItems(
            leading: Button(action: {
                mode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.left.circle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            })
        )
    }
}

struct TechArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TechArticleDetailView(article: TechArticle.articles[1])
    }
}
