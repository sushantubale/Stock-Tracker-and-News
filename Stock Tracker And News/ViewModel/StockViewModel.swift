//
//  StockViewModel.swift
//  Stock Tracker And News
//
//  Created by Sushant Ubale on 9/17/24.
//

import Foundation
import Combine
import SwiftUI

protocol StockWebService {
    func getStock(stockSymbol: String)
}

class StockViewModel: ObservableObject, StockWebService {
    
    @Published var stockModel: [StockModel]?
    @ObservedObject var stockService = StockService()
    
    init() {
        stockService.$stockModel
            .assign(to: &$stockModel)
    }

    func getStock(stockSymbol: String) {
        stockService.getStockData(stockName: stockSymbol)
    }
}
