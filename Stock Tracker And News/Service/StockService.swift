//
//  StockService.swift
//  Stock Tracker And News
//
//  Created by Sushant Ubale on 9/17/24.
//

import Foundation
import Combine

protocol Stock {
    func getStockData(stockName: String)
    func getStockList()
}
class StockService: ObservableObject, Stock {
    
    private var cancellable = Set<AnyCancellable>()
    @Published var stockModel: [StockModel]?
    @Published var singleStockModel: [SingleStockModel]?
    @Published var isLoadingStockListDone = false
    @Published var isLoadingStockNameDone = false

    func getStockData(stockName: String) {
        guard let url = URL(string: "https://financialmodelingprep.com/api/v3/search?query=\(stockName)&apikey=WwG1yO8SYPSkJawMP3N3MQNzU1NPVykZ") else {return}
        URLSession.shared.dataTaskPublisher(for: url)
            .map {$0.data}
            .decode(type: [StockModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] status in
                self?.isLoadingStockNameDone = true
            } receiveValue: { [weak self] stockModel in
                self?.isLoadingStockNameDone = true
                self?.stockModel = stockModel
            }
            .store(in: &cancellable)
    }
    
    func getStockList() {
        guard let url = URL(string: "https://financialmodelingprep.com/api/v3/stock/list?apikey=WwG1yO8SYPSkJawMP3N3MQNzU1NPVykZ") else {return}
        URLSession.shared.dataTaskPublisher(for: url)
            .map {$0.data}
            .receive(on: DispatchQueue.main)
            .decode(type: [SingleStockModel].self, decoder: JSONDecoder())
            .sink { [weak self] status in
                self?.isLoadingStockListDone = true
            } receiveValue: { [weak self] singleStockModel in
                self?.isLoadingStockListDone = true
                self?.singleStockModel = singleStockModel
            }
            .store(in: &cancellable)
    }
}
