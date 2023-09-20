//
//  News.swift
//  TestProjectSwiftUI
//
//  Created by Олег Алексеев on 20.09.2023.
//

import Foundation

struct NewsModel: Decodable {
    let results: [News]
}
struct News: Decodable {
    let id: Int
    let date: Date
    let title: String

    enum CodingKeys: String, CodingKey {
        case id
        case date = "publication_date"
        case title
    }

    var formattedDate: String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withDay, .withMonth, .withYear]
        return formatter.string(from: date)
    }
}
