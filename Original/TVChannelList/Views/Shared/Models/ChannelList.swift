//
//  ItemModel.swift
//  MySwisscom
//
//  Created by Roman Indermühle on 19.05.23.
//

import Foundation

struct ChannelList: Codable, Identifiable {
    var id = UUID()
    let name: String
}

