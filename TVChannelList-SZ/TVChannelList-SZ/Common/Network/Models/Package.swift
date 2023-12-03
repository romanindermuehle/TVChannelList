//
//  Package.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 03.12.23.
//

import Foundation

struct Package: Codable {
    let id: Int?
    let channels: [PackageChannel]?
    let title: String?
    let replay: Bool?
    let packageLang: ChannelLanguange?
}

struct PackageChannel: Codable {
    let id: Int?
}
 
