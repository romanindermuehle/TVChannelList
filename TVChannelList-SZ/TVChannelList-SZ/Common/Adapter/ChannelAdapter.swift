//
//  ChannelAdapter.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 04.12.23.
//

import Foundation

struct ChannelAdapter {

    static func convertObjects(_ response: [String: Channel]?) -> [RealmChannel] {
        guard let response else { return [] }
        return response
            .compactMap { convertObject($0.key, responseValue: $0.value) }
    }

    static func convertObject(_ responseKey: String, responseValue: Channel) -> RealmChannel {

        let realmChannel = RealmChannel()
        realmChannel.channelId = responseKey
        realmChannel.logo = convertLogoPath(for: responseValue.logo)
        realmChannel.title = responseValue.title ?? ""
        realmChannel.desc = responseValue.description ?? ""
        responseValue.lang?.forEach { realmChannel.lang.append($0.rawValue) }
        responseValue.genre?.forEach { realmChannel.genre.append($0.rawValue) }

        return realmChannel
    }

    static func convertLogoPath(for logo: String?) -> String {
        guard let logo else { return "" }
        return logo
            .replacingOccurrences(of: "{resolution}", with: "W90")
            .replacingOccurrences(of: "{fileType}", with: "png")
    }
}
