//
//  SingleStockModel.swift
//  Stock Tracker And News
//
//  Created by Sushant Ubale on 9/19/24.
//

import Foundation

// MARK: - SingleStockModel
struct SingleStockModel: Decodable {
    let symbol: String?
    let name: String?
    let price: Double?
    let exchange: Exchange?
    let exchangeShortName: ExchangeShortName?
    let type: TypeEnum?
}

// Exchange.swift

import Foundation

enum Exchange: String, Codable {
    case americanStockExchange = "American Stock Exchange"
    case amsterdam = "Amsterdam"
    case aquisAQSE = "Aquis AQSE"
    case athens = "Athens"
    case australianSecuritiesExchange = "Australian Securities Exchange"
    case bats = "BATS"
    case berlin = "Berlin"
    case bombayStockExchange = "Bombay Stock Exchange"
    case brussels = "Brussels"
    case bse = "BSE"
    case budapest = "Budapest"
    case buenosAires = "Buenos Aires"
    case canadianSEC = "Canadian Sec"
    case canadianSecuritiesExchange = "Canadian Securities Exchange"
    case cboeBzx = "CBOE BZX"
    case cboeCA = "Cboe CA"
    case cboeEurope = "Cboe Europe"
    case cboeUS = "Cboe US"
    case copenhagen = "Copenhagen"
    case dubai = "Dubai"
    case dusseldorf = "Dusseldorf"
    case egx = "EGX"
    case exchangeNasdaq = "Nasdaq"
    case frankfurt = "Frankfurt"
    case frankfurtStockExchange = "Frankfurt Stock Exchange"
    case hamburg = "Hamburg"
    case helsinki = "Helsinki"
    case hkse = "HKSE"
    case hose = "HOSE"
    case iceland = "Iceland"
    case internationalOrderBook = "International Order Book"
    case iob = "IOB"
    case irish = "Irish"
    case istanbulStockExchange = "Istanbul Stock Exchange"
    case jakartaStockExchange = "Jakarta Stock Exchange"
    case johannesburg = "Johannesburg"
    case kosdaq = "KOSDAQ"
    case kse = "KSE"
    case kualaLumpur = "Kuala Lumpur"
    case kuwait = "Kuwait"
    case lisbon = "Lisbon"
    case londonStockExchange = "London Stock Exchange"
    case madridStockExchange = "Madrid Stock Exchange"
    case mexico = "Mexico"
    case milan = "Milan"
    case moscowStockExchange = "Moscow Stock Exchange"
    case munich = "Munich"
    case nasdaq = "NASDAQ"
    case nasdaqCapitalMarket = "NASDAQ Capital Market"
    case nasdaqGlobalMarket = "NASDAQ Global Market"
    case nasdaqGlobalSelect = "NASDAQ Global Select"
    case nationalStockExchangeOfIndia = "National Stock Exchange of India"
    case neo = "NEO"
    case newYorkStockExchange = "New York Stock Exchange"
    case newYorkStockExchangeArca = "New York Stock Exchange Arca"
    case nordicGrowthMarket = "Nordic Growth Market"
    case nzse = "NZSE"
    case osloStockExchange = "Oslo Stock Exchange"
    case otcMarketsEXMKT = "OTC Markets EXMKT"
    case otcMarketsOTCPK = "OTC Markets OTCPK"
    case otcMarketsOTCQB = "OTC Markets OTCQB"
    case otcMarketsOTCQX = "OTC Markets OTCQX"
    case otherOTC = "Other OTC"
    case paris = "Paris"
    case prague = "Prague"
    case qatar = "Qatar"
    case riga = "Riga"
    case santiago = "Santiago"
    case saudi = "Saudi"
    case shanghai = "Shanghai"
    case shenzhen = "Shenzhen"
    case stockExchangeOfSingapore = "Stock Exchange of Singapore"
    case stockholmStockExchange = "Stockholm Stock Exchange"
    case stuttgart = "Stuttgart"
    case swissExchange = "Swiss Exchange"
    case sãoPaulo = "São Paulo"
    case taipeiExchange = "Taipei Exchange"
    case taiwan = "Taiwan"
    case telAviv = "Tel Aviv"
    case thailand = "Thailand"
    case tokyo = "Tokyo"
    case torontoStockExchange = "Toronto Stock Exchange"
    case torontoStockExchangeVentures = "Toronto Stock Exchange Ventures"
    case tsxv = "TSXV"
    case vienna = "Vienna"
    case warsawStockExchange = "Warsaw Stock Exchange"
    case xetra = "XETRA"
}

// ExchangeShortName.swift

import Foundation

enum ExchangeShortName: String, Codable {
    case amex = "AMEX"
    case ams = "AMS"
    case aqs = "AQS"
    case asx = "ASX"
    case ath = "ATH"
    case ber = "BER"
    case bme = "BME"
    case bru = "BRU"
    case bse = "BSE"
    case bud = "BUD"
    case bue = "BUE"
    case cai = "CAI"
    case cboe = "CBOE"
    case cnq = "CNQ"
    case cph = "CPH"
    case dfm = "DFM"
    case doh = "DOH"
    case dus = "DUS"
    case dxe = "DXE"
    case etf = "ETF"
    case euronext = "EURONEXT"
    case exchangeShortNameSET = "SET"
    case ham = "HAM"
    case hel = "HEL"
    case hkse = "HKSE"
    case ice = "ICE"
    case iob = "IOB"
    case ist = "IST"
    case jkt = "JKT"
    case jnb = "JNB"
    case jpx = "JPX"
    case kls = "KLS"
    case koe = "KOE"
    case ksc = "KSC"
    case kuw = "KUW"
    case lse = "LSE"
    case mcx = "MCX"
    case mex = "MEX"
    case mil = "MIL"
    case mun = "MUN"
    case nasdaq = "NASDAQ"
    case neo = "NEO"
    case nse = "NSE"
    case nyse = "NYSE"
    case nze = "NZE"
    case osl = "OSL"
    case otc = "OTC"
    case pnk = "PNK"
    case pra = "PRA"
    case ris = "RIS"
    case sao = "SAO"
    case sau = "SAU"
    case ses = "SES"
    case sgo = "SGO"
    case shh = "SHH"
    case shz = "SHZ"
    case six = "SIX"
    case sto = "STO"
    case stu = "STU"
    case tai = "TAI"
    case tlv = "TLV"
    case tsx = "TSX"
    case tsxv = "TSXV"
    case two = "TWO"
    case vie = "VIE"
    case vse = "VSE"
    case wse = "WSE"
    case xetra = "XETRA"
}

// TypeEnum.swift

import Foundation

enum TypeEnum: String, Codable {
    case etf = "etf"
    case fund = "fund"
    case stock = "stock"
    case trust = "trust"
}

// JSONSchemaSupport.swift
