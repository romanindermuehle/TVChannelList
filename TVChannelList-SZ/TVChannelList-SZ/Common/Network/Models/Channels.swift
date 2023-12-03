//
//  Channels.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 03.12.23.
//

import Foundation

struct Channels: Codable {
    let channels: [String: Channel]
    let packages: Package
    let radioChannels: [String: Channel]?
    let radioLineup: [ChannelLanguange: [Int]]?
    let appChannels: [String: Channel]?
}
