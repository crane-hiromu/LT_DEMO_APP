//
//  APICliant.swift
//  LT_Demo_APP
//
//  Created by Hiromu Tsuruta on 2019/01/22.
//  Copyright © 2019年 Hiromu Tsuruta. All rights reserved.
//

import Alamofire

// MARK: - API

struct APICliant {
    
    // MARK: Variables
    
    private static let successRange = 200..<400
    private static let contentType = ["application/json"]
    
    
    // MARK: Methods
    
    static func call(
        page: Int = 1,
        success: @escaping ([MainViewModel]) -> Void,
        failure: @escaping (Error) -> Void
    ) {
        Alamofire
            .request("https://qiita.com/api/v2/items?page=\(page)&per_page=10")
            .validate(statusCode: successRange)
            .validate(contentType: contentType)
            .responseData { response in
                
                switch response.result {
                case .success(let data):
                    decode(data: data, success: success, failure: failure)
                    
                case .failure(let error):
                    failure(error)
                }
        }
    }
    
    private static func decode(
        data: Data,
        success: @escaping ([MainViewModel]) -> Void,
        failure: @escaping (Error) -> Void
    ) {
        if let result = try? JSONDecoder(type: .convertFromSnakeCase).decode([MainViewModel].self, from: data) {
            success(result)
            
        } else {
            failure(ErrorResponse(dataContents: String(data: data, encoding: .utf8)))
            
        }
    }
}


// MARK: - JSONDecoder Extension

private extension JSONDecoder {
    
    convenience init(type: JSONDecoder.KeyDecodingStrategy) {
        self.init()
        self.keyDecodingStrategy = type
    }
}


// MARK: - ErrorResponse

struct ErrorResponse: Error, CustomStringConvertible {
    let description: String = "-- Decode Error --"
    var dataContents: String?
}
