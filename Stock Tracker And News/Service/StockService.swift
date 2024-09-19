//
//  StockService.swift
//  Stock Tracker And News
//
//  Created by Sushant Ubale on 9/17/24.
//

import Foundation
import Combine

class StockService: ObservableObject {
    
    private var cancellable = Set<AnyCancellable>()
    @Published var stockModel: [StockModel]?
    
    func getStockData(stockName: String) {
        guard let url = URL(string: "https://financialmodelingprep.com/api/v3/search?query=\(stockName)&apikey=WwG1yO8SYPSkJawMP3N3MQNzU1NPVykZ") else {return}
        URLSession.shared.dataTaskPublisher(for: url)
            .map {$0.data}
            .decode(type: [StockModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { status in
                print("\(status)")
            } receiveValue: { [weak self] stockModel in
                self?.stockModel = stockModel
            }
            .store(in: &cancellable)
    }
}
