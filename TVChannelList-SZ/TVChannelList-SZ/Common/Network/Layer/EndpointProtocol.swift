//
//  EndpointProtocol.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 04.12.23.
//

import Foundation

protocol EndpointProtocol {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: Any]? { get }
}
