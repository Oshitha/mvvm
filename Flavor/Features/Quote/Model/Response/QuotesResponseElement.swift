//
//  QuotesResponseElement.swift
//  Flavor
//
//  Created by Oshitha on 2022-07-04.
//

import Foundation

// MARK: - QuotesResponseElementElement
struct QuotesResponseElementElement: Decodable {
    let anime, character, quote: String?
}
