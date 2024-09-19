//
//  NewsModel.swift
//  Stock Tracker And News
//
//  Created by Sushant Ubale on 9/17/24.
//

import Foundation

struct NewsModel: Codable {
    let content: [Content]?
    let pageable: Pageable?
    let totalPages, totalElements: Int?
    let last: Bool?
    let number, size, numberOfElements: Int?
    let sort: Sort?
    let first, empty: Bool?
}

// MARK: - Content
struct Content: Codable {
    let title, date, content, tickers: String?
    let image: String?
    let link: String?
    let author, site: String?
}

// MARK: - Pageable
struct Pageable: Codable {
    let sort: Sort?
    let pageSize, pageNumber, offset: Int?
    let paged, unpaged: Bool?
}

// MARK: - Sort
struct Sort: Codable {
    let sorted, unsorted, empty: Bool?
}
