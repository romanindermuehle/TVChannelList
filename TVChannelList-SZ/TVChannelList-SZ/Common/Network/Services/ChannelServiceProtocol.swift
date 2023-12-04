//
//  ChannelServiceProtocol.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 04.12.23.
//

import Foundation

protocol ChannelServiceProtocol {
    func getAll() async -> Result<Channels, RequestError>
}
