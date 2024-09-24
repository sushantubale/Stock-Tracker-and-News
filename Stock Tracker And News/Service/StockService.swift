//
//  StockService.swift
//  Stock Tracker And News
//
//  Created by Sushant Ubale on 9/17/24.
//

import Foundation
import Combine

class StockService: ObservableObject, Stock {
    
    private var cancellable = Set<AnyCancellable>()
    @Published var stockModel: [StockModel]?
    @Published var singleStockModel: [SingleStockModel]?
    @Published var stockDetails: [StockDetailsModel]?
    @Published var isLoadingStockListDone = false
    @Published var isLoadingStockNameDone = false
    
    func getDataFor<T>(_ type: ServiceTypes, _ returnType: T.Type,_ stockName: String?) where T : Decodable {
        let url = type.getUrlForType(type, stockName)
        URLSession.shared.dataTaskPublisher(for: url)
            .map {$0.data}
            .receive(on: DispatchQueue.main)
            .decode(type: T.self, decoder: JSONDecoder())
            .sink { status in
                switch status {
                case .finished:
                    print("\(url) finished with type \(type)")
                case .failure(let error):
                    print("\(url) failed with error \(error)")
                }
            } receiveValue: { [weak self] result in
                switch type {
                case .singleStock:
                    self?.isLoadingStockNameDone = true
                    self?.stockModel = result as? [StockModel]
                case .stockDetails:
                    self?.stockDetails = result as? [StockDetailsModel]
                case .stockList:
                    self?.isLoadingStockListDone = true
                    let tempResult = result as? [SingleStockModel]
                    self?.singleStockModel = tempResult?.filter {$0.exchangeShortName?.rawValue == "NASDAQ"}
                }
            }
            .store(in: &cancellable)

    }
}
