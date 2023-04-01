//
//  Chapter11ExerciseView.swift
//  MasteringSwiftUI
//
//  Created by Yemireddi Sateesh on 01/04/23.
//

import SwiftUI

struct Chapter11ExerciseView: View {
    var body: some View {
        List(Article.articles) { article in
            ArticleRowView(article: article)
        }
        .listStyle(.plain)
        .listRowSeparator(.hidden)
    }
}

struct Chapter11ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        Chapter11ExerciseView()
    }
}

struct ArticleRowView: View {
    var article: Article

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
