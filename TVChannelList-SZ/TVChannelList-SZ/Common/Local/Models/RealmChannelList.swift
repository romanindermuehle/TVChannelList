//
//  RealmChannelList.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 04.12.23.
//

import RealmSwift

class RealmChannelList: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String
    @Persisted var channels: List<RealmChannel> = .init()
}
