//
//  LocalChannelList.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 04.12.23.
//

import Foundation
import SwiftData

@Model
class LocalChannelList {
    let id: UUID
    let name: String

    init(name: String) {
        self.id = UUID()
        self.name = name
    }
}
