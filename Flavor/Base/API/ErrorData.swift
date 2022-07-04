//
//  ErrorData.swift
//  Flavor
//
//  Created by Oshitha on 2022-07-04.
//

import Foundation

struct ErrorData: Codable {
    var statusCode: Int?
    var message: String?
    var error: String?
}
