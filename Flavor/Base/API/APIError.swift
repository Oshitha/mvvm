//
//  APIError.swift
//  Flavor
//
//  Created by Oshitha on 2022-07-04.
//

import Foundation

enum APIError: Error {
    case http(ErrorData)
    case unknown
    case errorMsg(String)
}
