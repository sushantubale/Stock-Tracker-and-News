//
//  NewsView.swift
//  Stock Tracker And News
//
//  Created by Sushant Ubale on 9/17/24.
//

import SwiftUI

struct NewsView: View {
    @ObservedObject private var newsViewModel = NewsViewModel()
    
    var body: some View {
        ScrollView {
        ForEach(newsViewModel.newsModels?.content ?? [], id: \.title) { newsModel in
                VStack {
                    AsyncImage(url: URL(string: newsModel.image ?? "NA")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    Text(newsModel.title ?? "NA")
                        .font(.headline)
                    
                    Text(formatDate(newsModel.date ?? "NA"))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text(extractContent(newsModel.content ?? "NA"))
                        .font(.body)
                        .lineLimit(3)
                    
                    HStack {
                        Spacer()
                        Link("Read More", destination: URL(string: newsModel.link ?? "NA")!)
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .padding()
    }
    
    func formatDate(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let date = dateFormatter.date(from:
 dateString)
 {
            dateFormatter.dateFormat = "MMMM d, yyyy"
            return dateFormatter.string(from: date)
        }
        return dateString
    }

    // Helper function to extract plain text content from HTML
    func extractContent(_ htmlString: String) -> String {
        // You'll need to implement or use a library for HTML parsing here
        // For simplicity, let's just remove HTML tags for now
        return htmlString.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }

}

#Preview {
    NewsView()
}
