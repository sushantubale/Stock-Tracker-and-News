//
//  StockModel.swift
//  Stock Tracker And News
//
//  Created by Sushant Ubale on 9/17/24.
//

import Foundation

// MARK: - StockModel
struct StockModel: Codable {
    let symbol, exchange, exchangeShortName, price: String?
    let name: String?
}

typealias Welcome = [StockModel]
