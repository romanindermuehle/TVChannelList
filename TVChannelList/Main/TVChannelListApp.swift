//
//  TVChannelListApp.swift
//  TVChannelList
//
//  Created by Roman Indermühle on 29.06.23.
//

import SwiftUI

@main
struct TVChannelListApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel())
        }
    }
}
