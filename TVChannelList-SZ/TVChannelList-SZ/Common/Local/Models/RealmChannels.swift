//
//  RealmChannels.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 04.12.23.
//

import RealmSwift

class RealmChannels: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var channels: List<RealmChannel> = .init()
    @Persisted var radioChannels: List<RealmChannel> = .init()
    @Persisted var appChannels: List<RealmChannel> = .init()
}
