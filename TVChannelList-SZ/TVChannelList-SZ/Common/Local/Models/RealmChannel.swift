//
//  RealmChannel.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 04.12.23.
//

import RealmSwift

class RealmChannel: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var channelId: String
    @Persisted var logo: String
    @Persisted var title: String
    @Persisted var desc: String
    @Persisted var lang: List<String> = .init()
    @Persisted var genre: List<String> = .init()
}
