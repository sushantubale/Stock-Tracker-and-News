//
//  ServiceTypes.swift
//  Stock Tracker And News
//
//  Created by Sushant Ubale on 9/23/24.
//

import Foundation

enum ServiceTypes {
    case singleStock
    case stockList
    case stockDetails
    func getUrlForType(_ type: ServiceTypes,_ stockName: String? = nil) -> URL {
        switch type {
        case .singleStock:
            if let url = URL(string: "https://financialmodelingprep.com/api/v3/search?query=\(stockName ?? "")&apikey=WwG1yO8SYPSkJawMP3N3MQNzU1NPVykZ") {
                return url
            }
        case .stockDetails:
            if let url = URL(string: "https://financialmodelingprep.com/api/v3/profile/\(stockName ?? "")?apikey=WwG1yO8SYPSkJawMP3N3MQNzU1NPVykZ") {
                return url
            }
        case .stockList:
            if let url = URL(string: "https://financialmodelingprep.com/api/v3/stock/list?apikey=WwG1yO8SYPSkJawMP3N3MQNzU1NPVykZ") {
                return url
            }
        }
        return URL(string: "")!
    }
}

extension Double {
    func formattedWithAbbreviations() -> String {
        let numFormatter = NumberFormatter()
        typealias Abbreviation = (threshold: Double, divisor: Double, suffix: String)
        let abbreviations: [Abbreviation]
 = [(0, 1, ""),
                                           (1000.0, 1000.0, "K"),

                                           (1000000.0, 1000000.0, "M"),
                                           (1000000000.0, 1000000000.0, "B")]
        // Go through the array backwards, so we do the largest first
        let abbreviation: Abbreviation = {
            var prevAbbreviation = abbreviations[0]
            for tmpAbbreviation in abbreviations {
                if self < tmpAbbreviation.threshold {
                    break
                }
                prevAbbreviation = tmpAbbreviation
            }
            return prevAbbreviation
        }()

        let value
 = Double(self) / abbreviation.divisor
        numFormatter.positiveSuffix = abbreviation.suffix
        numFormatter.negativeSuffix = abbreviation.suffix
        numFormatter.allowsFloats = true
        numFormatter.minimumIntegerDigits = 1
        numFormatter.minimumFractionDigits = 0
        numFormatter.maximumFractionDigits = 1

        return numFormatter.string(from:
 NSNumber(value:
 value)) ?? "\(value)"
    }
}
