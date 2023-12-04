//
//  ChannelsEndpoint.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 04.12.23.
//

import Foundation

enum ChannelsEndpoint {
    case getAll
}

extension ChannelsEndpoint: EndpointProtocol {

    var path: String {
        switch self {
        case .getAll: "/portal-services/portal-integration/ws/channellist/channel-list/de"
        }
    }

    var method: RequestMethod {
        switch self {
        case .getAll: .get
        }
    }

    var header: [String : String]? {
        return nil
    }

    var body: [String : Any]? {
        return nil
    }
}
