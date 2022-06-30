//
//  APIConstant.swift
//  Flavor
//
//  Created by Oshitha on 2022-06-30.
//

import Foundation

enum APIConstants {
    
#if DEV
    static let baseUrl = "https://animechan.vercel.app"
#elseif QA
    static let baseUrl = "https://animechan.vercel.app"
#else
    static let baseUrl = "https://animechan.vercel.app"
#endif
    
    
}
