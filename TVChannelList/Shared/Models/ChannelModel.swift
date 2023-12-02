//
//  ChannelItems.swift
//  MySwisscom
//
//  Created by Roman Indermühle on 12.05.23.
//

import Foundation

struct Response: Codable {
    let channels: [String: ChannelElement]
}

struct ChannelElement: Codable {
    let title: String
    var logo: String
}

struct Channel: Identifiable, Hashable, Codable {
    var id = UUID()
    let title: String
    let logo: String
    var isDeleted: Bool = false
}
