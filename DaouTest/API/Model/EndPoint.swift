//
//  EndPoint.swift
//  DaouTest
//
//  Created by 최윤제 on 2023/02/10.
//

import Foundation

import Alamofire

enum DaouAPI {
    case requestAll(page: String)
}


extension DaouAPI {
    var url: URL {
        switch self {
        case .requestAll(let page):
            return URL(string: "http://13.124.240.76:8080/api/products?page=\(page)&size=20")!
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .requestAll(_):
            return ["Content-Type" : "application/x-www-form-urlencoded"]
        }
    }
        
    var parameters: [String: Any]? {
            switch self {
            case .requestAll(_):
                return nil
        }
    }
    
}
