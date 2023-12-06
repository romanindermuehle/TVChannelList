//
//  ListView.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 04.12.23.
//

import SwiftUI

struct ListView: View {

    @State var viewModel: ListViewModel

    var body: some View {
        VStack {
            Picker("", selection: $viewModel.pickerTag) {
                Text("TV").tag(0)
                Text("Radio").tag(1)
                Text("App").tag(2)
            }
            .onChange(of: viewModel.pickerTag, {
                viewModel.changePicker()
            })
            .pickerStyle(.segmented)
            .padding()

            List(viewModel.showedChannels, id: \._id) { channel in
                VStack(alignment: .leading, spacing: 10.0) {
                    HStack(spacing: 15.0) {
                        Text("\(channel.title)")
                            .font(.system(size: 18.0, weight: .bold))

                        Spacer()

                        if let url = URL(string: channel.logo) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                Image(systemName: "photo")
                                    .imageScale(.large)
                                    .foregroundColor(.gray)
                            }
                            .frame(width: 45.0)
                        } else {
                            Image(systemName: "photo")
                                .imageScale(.large)
                                .foregroundColor(.gray)
                        }
                    }

                    Text(channel.desc)
                        .font(.system(size: 10.0))
                        .lineLimit(3)
                        .foregroundStyle(.gray)
                }
                .padding([.top, .bottom], 10.0)
            }
        }
        .navigationTitle(viewModel.list.name)
    }
}
