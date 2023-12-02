//
//  MySwisscomApp.swift
//  MySwisscom
//
//  Created by Roman Indermühle on 11.05.23.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - manages Models for View
 
 */

@main
struct MySwisscomApp: App {
    @StateObject var listviewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
                    .environmentObject(listviewModel)
            }
        }
    }
}
