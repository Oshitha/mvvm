//
//  QuoteAPIs.swift
//  Flavor
//
//  Created by Oshitha on 2022-07-04.
//

import Foundation
import Alamofire
import Combine

enum QuoteAPIs: URLRequestBuilder{
    case getQuotesList
}

extension QuoteAPIs{

    var path: String{
        switch self {
        case .getQuotesList:
            return "/api/quotes"
        }
    }

    var parameters: Parameters?{
        return [:]
    }

    var method: HTTPMethod{
        switch self {
        case .getQuotesList:
            return HTTPMethod.get
        }
    }
    
    func resolve() ->URLRequestBuilder{
        
        switch self {
        case .getQuotesList:
            return QuoteAPIs.getQuotesList
        }
    }
}
