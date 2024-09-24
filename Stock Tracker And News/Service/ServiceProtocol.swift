//
//  ServiceProtocol.swift
//  Stock Tracker And News
//
//  Created by Sushant Ubale on 9/23/24.
//

protocol Stock {
    func getDataFor<T: Decodable>(_ type: ServiceTypes, _ returnType: T.Type,_ stockName: String?)
}


