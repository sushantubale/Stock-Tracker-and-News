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
    func getStockList()
    func getStockDetails(stockSymbol: String)
}

class StockViewModel: ObservableObject, StockWebService {
    
    @Published var stockModel: [StockModel]?
    @Published var singleStockModel: [SingleStockModel]?
    @Published var stockDetails: [StockDetailsModel]?
    @ObservedObject var stockService = StockService()
    @Published var isLoadingStockListDone = false
    @Published var isLoadingStockNameDone = false

    init() {
        stockService.$stockModel
            .assign(to: &$stockModel)
        stockService.$singleStockModel
            .assign(to: &$singleStockModel)
        stockService.$isLoadingStockListDone
            .assign(to: &$isLoadingStockListDone)
        stockService.$isLoadingStockNameDone
            .assign(to: &$isLoadingStockNameDone)
        stockService.$stockDetails
            .assign(to: &$stockDetails)
    }

    func getStock(stockSymbol: String) {
        stockService.getDataFor(.singleStock, [StockModel].self, stockSymbol)
    }
    func getStockList() {
        stockService.getDataFor(.stockList, [SingleStockModel].self, nil)
    }
    func getStockDetails(stockSymbol: String) {
        stockService.getDataFor(.stockDetails, [StockDetailsModel].self, stockSymbol)
    }
}
