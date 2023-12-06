//
//  TVChannelList_SZApp.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 03.12.23.
//

import SwiftUI
import RealmSwift

@main
struct TVChannelList_SZApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.realmConfiguration, Realm.Configuration())
        }
    }
}
