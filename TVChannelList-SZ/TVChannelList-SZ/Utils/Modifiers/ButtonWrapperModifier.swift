//
//  ButtonWrapperModifier.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 03.12.23.
//

import SwiftUI

struct ButtonWrapperModifier: ViewModifier {

    var action: () -> Void

    func body(content: Content) -> some View {
        Button { action() } label: { content }
    }
}
