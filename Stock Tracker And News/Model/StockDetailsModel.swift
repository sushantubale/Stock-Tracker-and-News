//
//  StockDetailsModel.swift
//  Stock Tracker And News
//
//  Created by Sushant Ubale on 9/24/24.
//

import Foundation

struct StockDetailsModel: Decodable {
    let symbol: String?
    let price, beta: Double?
    let volAvg, mktCap, lastDiv: Int?
    let range: String?
    let changes: Double?
    let companyName, currency, cik, isin: String?
    let cusip, exchange, exchangeShortName, industry: String?
    let website: String?
    let description, ceo, sector, country: String?
    let fullTimeEmployees, phone, address, city: String?
    let state, zip: String?
    let dcfDiff, dcf: Double?
    let image: String?
    let ipoDate: String?
    let defaultImage, isEtf, isActivelyTrading, isAdr: Bool?
    let isFund: Bool?
}
