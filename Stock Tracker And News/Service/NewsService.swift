//
//  NewsService.swift
//  Stock Tracker And News
//
//  Created by Sushant Ubale on 9/17/24.
//

import Foundation
import Combine
import SwiftUI

class NewsService: ObservableObject {
    
    @Published var newsModels: NewsModel?
    private var cancellable = Set<AnyCancellable>()
    func getNews() {
        guard let url = URL(string: "https://financialmodelingprep.com/api/v3/fmp/articles?page=0&size=5&apikey=WwG1yO8SYPSkJawMP3N3MQNzU1NPVykZ") else {return}
        URLSession.shared.dataTaskPublisher(for: url)
            .map {$0.data}
            .receive(on: DispatchQueue.main)
            .decode(type: NewsModel.self, decoder: JSONDecoder())
            .sink { status in
                print("\(status)")
            } receiveValue: { newsModel in
                self.newsModels = newsModel
            }
            .store(in: &cancellable)
    }
}
