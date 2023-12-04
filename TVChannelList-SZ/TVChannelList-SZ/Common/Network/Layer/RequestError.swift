//
//  RequestError.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 04.12.23.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown

    var message: String {
        switch self {
        case .decode: "Error on Decoding"
        case .unauthorized: "Not Authorized"
        case .invalidURL: "URL not correct"
        case .noResponse: "Response is Empty"
        case .unexpectedStatusCode: "StatusCode not handled"
        default: "Unknown Error"
        }
    }
}
