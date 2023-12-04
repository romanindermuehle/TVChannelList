//
//  TVChannelList_SZApp.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 03.12.23.
//

import SwiftUI
import SwiftData

@main
struct TVChannelList_SZApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .modelContainer(for: [LocalChannelList.self])
        }
    }
}
