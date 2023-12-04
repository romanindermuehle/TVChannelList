//
//  ChannelService.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 04.12.23.
//

import Foundation

struct ChannelService: NetworkClient, ChannelServiceProtocol {

    func getAll() async -> Result<Channels, RequestError> {
        return await request(endpoint: ChannelsEndpoint.getAll, responseModel: Channels.self)
    }
}
