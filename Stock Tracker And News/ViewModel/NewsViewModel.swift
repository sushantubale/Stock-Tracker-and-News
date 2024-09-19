//
//  NewsViewModel.swift
//  Stock Tracker And News
//
//  Created by Sushant Ubale on 9/17/24.
//

import Foundation
import SwiftUI
import Combine

class NewsViewModel: ObservableObject {
    
    @Published var newsModels: NewsModel?
    @ObservedObject var newsService = NewsService()
    
    init() {
        newsService.$newsModels
            .assign(to: &$newsModels)
        getNews()
    }
    
    func getNews() {
        newsService.getNews()
    }
}
