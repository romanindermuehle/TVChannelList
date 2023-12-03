//
//  View.swift
//  TVChannelList-SZ
//
//  Created by Simon Zwicker on 03.12.23.
//

import SwiftUI

extension View {

    func button(action: @escaping () -> Void) -> some View {
        modifier(ButtonWrapperModifier(action: action))
    }
}
