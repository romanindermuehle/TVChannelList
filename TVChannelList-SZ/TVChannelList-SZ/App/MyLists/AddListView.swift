//
//  AddListView.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 04.12.23.
//

import SwiftUI

struct AddListView: View {

    @Environment(\.dismiss) var dismiss
    @State var listName: String = ""

    var body: some View {
        VStack(spacing: 15.0) {
            Text("Add new List")
                .font(.system(size: 16.0, weight: .bold))

            TextField("Listname", text: $listName)
                .padding()
                .background(.cyan.opacity(0.1))
                .clipShape(.rect(cornerRadius: 10.0))

            Text("Add")
                .font(.system(size: 22.0, weight: .bold))
                .disabled(listName.isEmpty)
                .foregroundStyle(.cyan)
                .button {
                    dismiss()
                }
                .padding(.top, 20.0)
        }
        .padding()
    }
}

#Preview {
    AddListView()
}
