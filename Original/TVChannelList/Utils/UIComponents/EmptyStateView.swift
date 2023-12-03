//
//  EmptyStateView.swift
//  TVChannelList
//
//  Created by Roman Indermühle on 07.11.2023.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack {
            Image(systemName: "binoculars.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .foregroundStyle(.blue)
            Text("No data in sight!")
                .font(.title)
                .fontWeight(.bold)
            Text("Add a list using +")
                .font(.title3)
        }
    }
}

#Preview {
    EmptyStateView()
}
