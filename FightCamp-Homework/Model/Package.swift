//
//  Package.swift
//  FightCamp-Homework
//
//  Created by Jenny Luu on 11/8/20.
//  Copyright © 2020 Alexandre Marcotte. All rights reserved.
//

import Foundation

struct Package: Codable {
    let title: String
    let desc: String
    let headline: String?
    let thumbnail_urls: [String]
    let included: [String]
    let excluded: [String]?
    let payment: String
    let price: Int
    let action: String
}
