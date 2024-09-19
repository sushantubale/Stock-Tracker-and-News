//
//  NewsDetailView.swift
//  Stock Tracker And News
//
//  Created by Sushant Ubale on 9/18/24.
//

import SwiftUI

struct NewsDetailView: View {
    let article: Content

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let title = article.title {
                    Text(title)
                        .font(.title)
                    Text(extractContent(article.content ?? "NA"))
                        .font(.body)
                }
            }
            .padding()
        }
    }
}
