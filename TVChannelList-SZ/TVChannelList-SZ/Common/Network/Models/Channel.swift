//
//  Channel.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 03.12.23.
//

import Foundation

struct Channel: Codable {
    let logo: String?
    let title: String?
    let description: String?
    let lang: [ChannelLanguange]?
    let genre: [ChannelGenre]?
    let replay: Bool?
    let alternativeAds: Bool?
    let quality: Int?
}
