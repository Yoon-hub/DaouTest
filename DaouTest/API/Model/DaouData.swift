//
//  DaouData.swift
//  DaouTest
//
//  Created by 최윤제 on 2023/02/10.
//

import Foundation

// MARK: - DaouData
struct DaouData: Codable {
    let content: [Content]
    let pageable: Pageable
    let last: Bool
    let totalPages, totalElements: Int
    let sort: Sort
    let first: Bool
    let number, numberOfElements, size: Int
    let empty: Bool
}

// MARK: - Content
struct Content: Codable {
    let id: Int
    let code, brand, name, summary: String
    let inventory, price: Int
    let content: String
    let imgURL: String

    enum CodingKeys: String, CodingKey {
        case id, code, brand, name, summary, inventory, price, content
        case imgURL = "imgUrl"
    }
}

// MARK: - Pageable
struct Pageable: Codable {
    let sort: Sort
    let pageNumber, pageSize, offset: Int
    let unpaged, paged: Bool
}

// MARK: - Sort
struct Sort: Codable {
    let sorted, unsorted, empty: Bool
}
