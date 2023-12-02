//
//  ChannelItem.swift
//  TVChannelList
//
//  Created by Roman Indermühle on 04.07.23.
//

import SwiftUI
import CachedAsyncImage

struct ChannelItem: View {
    @State var channel: Channel
    
    
    var body: some View {
        HStack {
            CachedAsyncImage(url: URL(string: channel.logo))
                .scaledToFit()
            Spacer()
            Text(channel.title)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .leading)
        }.padding()
    }
}

struct ChannelItem_Previews: PreviewProvider {
    static var previews: some View {
        
        let row = Channel(title: "Test", logo: "https://services.sg101.prd.sctv.ch/content/images/tv/channel/1221_image_5_W90.png")
        ChannelItem(channel: row)
    }
}
